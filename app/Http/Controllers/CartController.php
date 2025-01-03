<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Card;
use App\Models\Product;
use App\Models\ProductVariants;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
   

    public function addToCard(Request $request)
    {
        // Find the product
        $product = ProductVariants::findOrFail($request->variant_id);
        // Set default quantity
        $qty = 1;
    
        // Adjust the quantity based on the request
        if ($request->quantity == 1) {
            $qty = $request->quantity;
        } elseif ($request->quantity > 2) {
            $qty = $request->quantity;
        }
    
        // Check if user is authenticated
        if (auth()->check()) {
            // For logged-in users, check if the item is already in the cart
            $card = Card::where('user_id', auth()->id())
                ->where('product_variant_id', $product->id)
                ->first();
    
            if ($card) {
                // If the item is already in the cart, update the quantity
                $card->qty += $qty;
            } else {
                // If the item is not in the cart, create a new cart entry
                $card = new Card;
                $card->user_id = auth()->id();
                $card->product_variant_id = $product->id;
                $card->qty = $qty;
            }
            $card->save(); // Save to the database
    
        } else {
            // For guest users, use session storage
            $sessionId = session()->getId();
            
            $card = Card::where('session_id', $sessionId)
                ->where('product_variant_id', $product->id)
                ->first();
            
            if ($card) {
                // If the item is already in the session-based cart, update the quantity
                $card->qty += $qty;
            } else {
                // If the item is not in the session-based cart, create a new cart entry
                $card = new Card;
                $card->session_id = $sessionId;
                $card->product_variant_id = $product->id;
                $card->qty = $qty;
            }
            $card->save(); // Save to the database for guests
        }
    
        
        return redirect()->back()->with('success', 'Add To Cart successfully!');
      //  return response()->json(['success' => 'Product added to cart', 'cart' => $this->getCartData()]);
    }
    
    // Helper function to get the current cart data for the response
    private function getCartData()
    {
        if (auth()->check()) {
            $cartItems = Card::where('user_id', auth()->id())->get();
        } else {
            $sessionId = session()->getId();
            $cartItems = Card::where('session_id', $sessionId)->get();
        }
    
        $cart = [];
        foreach ($cartItems as $item) {
            $cart[$item->product_id] = [
                'product_id' => $item->product_id,
                'name' => $item->product->name,
                'price' => $item->product->price,
                'qty' => $item->qty,
                'image' => $item->product->image,
            ];
        }
    
        return $cart;
    }
    



    public function viewCart()
    {
        // if (Auth::check()) {
        //     // For authenticated users, fetch the card items from the database
        //     $cardItems = Card::where('user_id', Auth::id())->with('product')->get();
        // } else {
        //     // For guest users, check if there are any items in the session cart
        //     $sessionCart = session()->get('cart', []);
            
        //     // To properly handle the session cart, we need to map the session cart to the product data (like Card model)
        //     $cardItems = collect($sessionCart)->map(function ($item) {
        //         // Assuming your session cart stores products in a simple structure, like product_id, qty, and other necessary fields.
        //         return (object)[
        //             'product' => \App\Models\Product::find($item['product_id']), // Find the product by ID
        //             'qty' => $item['qty'], // Quantity from the session cart
        //         ];
        //     });
        // }
    
        // Return the view with the card items
        return view('web.cart');
    }
    


    public function update(Request $request, $id)
    {  
        if (Auth::check()) {
            // Authenticated user logic
            $card = Card::find($id);
            // $minQty  = $card->product_variant->product->min_stock ?? 1;
            if ($card && $card->user_id === Auth::id()) {
                $action = $request->input('action');
                if ($action === 'add') {
                    $card->qty += 1;
                } else if ($action === 'sub' && $card->qty > 1) {
                    $card->qty -= 1;
                }
                $card->save();
            }
        } else {
           
            // Guest user logic
            $card = Card::find($id);
            // $minQty  = $card->product_variant->product->min_stock ?? 1;
            if ($card && $card->session_id === session()->getId()) {
                $action = $request->input('action');
                if ($action === 'add') {
                    $card->qty += 1;
                } else if ($action === 'sub' && $card->qty > 1) {
                    $card->qty -= 1;
                }
                $card->save();
            }
        }

        return redirect()->back()->with('success', 'Cart Update successfully!');
    }

    public function update_direct(Request $request, $id)
    {
        $cartItem = Card::findOrFail($id);
        $newQty = $request->input('qty');
    
        // Update the quantity
        $cartItem->qty = $newQty;
        $cartItem->save();
    
        return response()->json(['success' => true, 'message' => 'Quantity updated', 'new_qty' => $newQty]);
    }
    public function remove($id)
    {
        if (Auth::check()) {
            // Authenticated user
            $card = Card::find($id);
            if ($card && $card->user_id === Auth::id()) {
                $card->delete();
            }
        } else {
            // Guest user
            $card = Card::find($id);
            if ($card) {
                $card->delete();
            }
        }

        return redirect()->back()->with('success', 'Item removed from cart!');
    }

    public function clearAll(Request $request)
    {
        if (Auth::check()) {
            // Authenticated user
            Card::where('user_id', Auth::id())->delete();
        } else {
            // Guest user
            Card::where("session_id",$request->session_id)->delete();
        }

        return redirect()->back()->with('success', 'Cart cleared successfully!');
    }
}