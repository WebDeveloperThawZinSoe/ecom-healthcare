<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Card;
use App\Mail\OrderConfirmation;
use Stripe\Stripe;
use Stripe\Exception\ApiErrorException;

class CheckoutController extends Controller
{
    public function store(Request $request)
    {
        // Validate the form input
        $rules = [
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'email' => 'required|email|max:255',
            'region' => 'required|string',
            'address' => 'required|string|max:500',
            'payment_method' => 'required|string',
            'note' => 'nullable|string|max:1000',
            'payment_account_name' => 'nullable|string|max:255',
            'payment_slip' => 'nullable|file|mimes:jpeg,png,jpg,pdf|max:2048',
        ];
        $validatedData = $request->validate($rules);

        $user_id = Auth::check() ? Auth::user()->id : null;
        $sessionId = session()->getId();
        $cartItems = $user_id
            ? Card::where("user_id", $user_id)->with('product_variant')->get()
            : Card::where("session_id", $sessionId)->with('product_variant')->get();

        if ($cartItems->isEmpty()) {
            return redirect()->back()->with('error', 'Your cart is empty.');
        }

        $total = $cartItems->sum(function ($cartItem) {
            $price = $cartItem->product_variant->price;
            $discount_amount = $cartItem->product_variant->discount_amount;
            switch ($cartItem->product_variant->discount_type) {
                case 0:
                    return $price * $cartItem->qty;
                case 1:
                    return ($price - $discount_amount) * $cartItem->qty;
                case 2:
                    return ($price - ($price * ($discount_amount / 100))) * $cartItem->qty;
                default:
                    return $price * $cartItem->qty;
            }
        });

        $payment_slip_name = null;
        if ($request->hasFile('payment_slip')) {
            $paymentSlip = $request->file('payment_slip');
            $payment_slip_name = time() . '_' . uniqid() . '.' . $paymentSlip->getClientOriginalExtension();
            $paymentSlip->move(public_path('payment_slips'), $payment_slip_name);
        }

        DB::beginTransaction();

        try {
            $order = Order::create([
                'name' => $request->name,
                'phone' => $request->phone,
                'order_number' => 'ORD-' . strtoupper(uniqid()),
                'region' => $request->region,
                'address' => $request->address,
                'user_id' => $user_id,
                'payment_method' => $request->payment_method,
                'payment_slip' => $payment_slip_name,
                'payment_account_name' => $request->payment_account_name,
                'email' => $request->email,
                'total_price' => $total,
                'note' => $request->note,
                'payment_status' => 0, // Default payment status
            ]);

            if ($request->payment_method == "stripe") {
                Stripe::setApiKey(config('services.stripe.secret'));
                try {
                    $charge = \Stripe\Charge::create([
                        'amount' => $total * 100,
                        'currency' => 'usd',
                        'description' => $order->order_number,
                        'source' => $request->stripeToken,
                    ]);
                    $order->update(['payment_status' => $charge->status === 'succeeded' ? $charge->status : 0]);
                } catch (ApiErrorException $e) {
                    throw new \Exception('Stripe Payment Failed: ' . $e->getMessage());
                }
            }

            foreach ($cartItems as $cartItem) {
                OrderDetail::create([
                    'order_number' => $order->order_number,
                    'order_id' => $order->id,
                    'product_variant_id' => $cartItem->product_variant_id,
                    'qty' => $cartItem->qty,
                    'price' => $cartItem->product_variant->price,
                    'discount_type' => $cartItem->product_variant->discount_type,
                    'discount_amount' => $cartItem->product_variant->discount_amount,
                ]);
            }

            Mail::to($request->email)->send(new OrderConfirmation([
                'order' => $order,
                'cartItems' => $cartItems,
            ]));

            $user_id
                ? Card::where("user_id", $user_id)->delete()
                : Card::where("session_id", $sessionId)->delete();

            DB::commit();
            return redirect('/checkout')->with('success', 'Order placed successfully!');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Order failed: ' . $e->getMessage());
        }
    }
}
