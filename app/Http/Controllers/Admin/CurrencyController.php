<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Currency;

class CurrencyController extends Controller
{
     // Display all currencies
     public function index()
     {
         $currencies = Currency::all();
         return view('admin.currencies.index', compact('currencies'));
     }
 
     // Store new currency
     public function store(Request $request)
     {
         $request->validate([
             'name' => 'required|string|max:255',
             'code' => 'required|string|max:10|unique:currencies,code',
             'exchange_rate' => 'required|numeric',
             'symbol' => 'required|string|max:10',
         ]);
 
         Currency::create($request->all());
 
         return redirect()->route('admin.currency.index')->with('status', 'Currency added successfully!');
     }
 
     // Update currency
     public function update(Request $request, $id)
     {
         $currency = Currency::findOrFail($id);
 
         $request->validate([
             'name' => 'required|string|max:255',
             'code' => 'required|string|max:10|unique:currencies,code,' . $id,
             'exchange_rate' => 'required|numeric',
             'symbol' => 'required|string|max:10',
         ]);
 
         $currency->update($request->all());
 
         return redirect()->route('admin.currency.index')->with('status', 'Currency updated successfully!');
     }
 
     // Delete currency
     public function destroy($id)
     {
         $currency = Currency::findOrFail($id);
         $currency->delete();
 
         return redirect()->route('admin.currency.index')->with('status', 'Currency deleted successfully!');
     }
}
