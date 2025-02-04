<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Delivery;
use Illuminate\Http\Request;
use App\Models\Currency;

class AdminDeliveryController extends Controller
{
    public function index() {
        $deliveries = Delivery::all();
        $currencies = Currency::all();
        return view('admin.deliveries.index', compact('deliveries',"currencies"));
    }

    public function store(Request $request) {
        $request->validate([
            'currency' => 'required|string|max:10',
            'deli_price' => 'required|numeric|min:0',
            'mini_price' => 'required|numeric|min:0',
            'note' => 'nullable|string'
        ]);

        Delivery::create($request->all());
        return redirect()->route('admin.delivery.index')->with('status', 'Delivery setting added successfully.');
    }

    public function edit(Delivery $delivery) {
        return response()->json($delivery);
    }

    public function update(Request $request, Delivery $delivery) {
        $request->validate([
            'currency' => 'required|string|max:10',
            'deli_price' => 'required|numeric|min:0',
            'mini_price' => 'required|numeric|min:0',
            'note' => 'nullable|string'
        ]);

        $delivery->update($request->all());
        return redirect()->route('admin.delivery.index')->with('status', 'Delivery setting updated successfully');
    }

    public function destroy($id) {
        $delivery = Delivery::findOrFail($id);
        $delivery->delete();
        return redirect()->route('admin.delivery.index')->with('status', 'Delivery setting deleted successfully');
    }
}
