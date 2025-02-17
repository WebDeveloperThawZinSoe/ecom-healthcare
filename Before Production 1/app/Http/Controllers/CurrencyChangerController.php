<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Currency;

class CurrencyChangerController extends Controller
{
    public function changeCurrency($currencyCode)
    {
        $currency = Currency::where('code', $currencyCode)->first();

        if (!$currency) {
            return redirect()->back()->with('error', 'Currency not found');
        }

        session(['currency' => $currencyCode]);

        return redirect()->back();
    }
}
