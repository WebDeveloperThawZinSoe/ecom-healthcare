@extends('web.master')
@section('body')



<style>
.payment-card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

#removeImageButton {
    background-color: #ff6b6b;
    color: #fff;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    font-size: 0.9em;
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: inline-block;
    margin-left: 10px;
}

#removeImageButton:hover {
    background-color: #ff4a4a;
}

#removeImageButton:focus {
    outline: none;
}
</style>
<div class="page-content">

    <!-- inner page banner End-->
    <div class="content-inner-1">
        <div class="container">
            <div class="row shop-checkout">
                <div class="col-xl-8">
                    <!-- <h4 class="title m-b15">Billing To</h4> -->
                    @php
                    $payment_methods = App\Models\PaymentMethod::get();
                    @endphp

                    <!-- <div class="row">
                    @foreach($payment_methods as $payment_method)
                    <div class="col-md-4 mb-3 col-6">
                        <div class="card payment-card h-100">
                            <div class="card-header text-center">
                                <img src="{{ asset('images/payment_method/' . $payment_method->icon) }}"
                                    style="width:100%; height:180px;" alt="Icon" class="img-fluid">
                            </div>
                            <div class="card-body text-left" style="height:120px !important;">
                                <h4 class="mt-3">{{ $payment_method->method_name }}</h4>
                                <p> {{ $payment_method->account_no }}</p>
                                <p> {{ $payment_method->account_name }}</p>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div> -->

                    <!-- <hr> -->
                    <h4 class="title m-b15">Delivery Information </h4>
                    <form class="row" method="POST" action="{{route('checkout.store')}}" enctype="multipart/form-data"
                        id="checkout-form">
                        @csrf

                        <!-- Name -->
                        <div class="col-md-6">
                            <div class="form-group m-b25">
                                <label class="label-title">Name *</label>
                                <input name="name" required class="form-control"
                                    value="{{ auth()->check() && auth()->user()->name ? auth()->user()->name : old('name') }}">
                            </div>
                        </div>

                        <!-- Phone -->
                        <div class="col-md-6">
                            <div class="form-group m-b25">
                                <label class="label-title">Phone *</label>
                                <input name="phone" required class="form-control"
                                    value="{{ auth()->check() && auth()->user()->phone ? auth()->user()->phone : old('phone') }}">
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="col-md-12">
                            <div class="form-group m-b25">
                                <label class="label-title">Email *</label>
                                <input type="email" name="email" required class="form-control"
                                    value="{{ auth()->check() && auth()->user()->email ? auth()->user()->email : old('email') }}">
                            </div>
                        </div>


                        <div class="col-md-12">
                            <div class="m-b25">
                                <label class="label-title">Country *</label>
                                <input type="text" id="countrySearch" placeholder="Type to search..." class="form-control w-100"
                                    onkeyup="filterCountries()" >
                                <select id="countryList" name="country" class="w-100" size="10" required></select>
                            </div>
                        </div>

                        <script>
                        const countries = [
                            "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda",
                            "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain",
                            "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
                            "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso",
                            "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic",
                            "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Costa Rica", "Croatia",
                            "Cuba", "Cyprus", "Czechia", "Democratic Republic of the Congo", "Denmark", "Djibouti",
                            "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador",
                            "Equatorial Guinea",
                            "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon",
                            "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea",
                            "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran",
                            "Iraq",
                            "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya",
                            "Kuwait",
                            "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Malaysia", "Maldives", "Mexico", "Mongolia",
                            "Myanmar", "Nepal", "Netherlands", "New Zealand", "Nigeria", "Norway", "Pakistan",
                            "Philippines", "Poland", "Portugal", "Russia", "Saudi Arabia", "Singapore",
                            "South Africa", "South Korea", "Spain", "Sweden", "Switzerland", "Thailand",
                            "United Kingdom", "United States", "Vietnam", "Zimbabwe"
                        ];

                        const countryList = document.getElementById('countryList');

                        function displayCountries(list) {
                            countryList.innerHTML = '';
                            list.forEach(country => {
                                const option = document.createElement('option');
                                option.value = country;
                                option.textContent = country;
                                countryList.appendChild(option);
                            });
                        }

                        function filterCountries() {
                            const searchTerm = document.getElementById('countrySearch').value.toLowerCase();
                            const filtered = countries.filter(country =>
                                country.toLowerCase().includes(searchTerm)
                            );
                            displayCountries(filtered);
                        }

                        // Show all countries on page load
                        displayCountries(countries);
                        </script>





                        <input type="hidden" id="delivery_fee_input" name="delivery_fee">

                        <!-- City -->
                        <div class="col-md-12">
                            <div class="form-group m-b25">
                                <label class="label-title">City *</label>
                                <input type="text" name="city" required class="form-control" value="{{ old('city') }}">
                            </div>
                        </div>

                        <!-- City -->
                        <div class="col-md-12">
                            <div class="form-group m-b25">
                                <label class="label-title">City Zip Code *</label>
                                <input type="text" name="city_zip_code" required class="form-control"
                                    value="{{ old('city_zip_code') }}">
                            </div>
                        </div>




                        <!-- Address -->
                        <div class="col-md-12">
                            <div class="form-group m-b25">
                                <label class="label-title">Address *</label>
                                <textarea name="address" required class="form-control"
                                    rows="3">{{ old('address') }}</textarea>
                            </div>
                        </div>

                        <!-- Payment Method -->
                        <div class="col-md-12">
                            <div class="form-group m-b25">
                                <label class="label-title">Payment Method *</label>
                                <div class="form-select">
                                    <select name="payment_method" required class="default-select w-100"
                                        onchange="togglePaymentFields()">
                                        @php $payment_methods = App\Models\PaymentMethod::get(); @endphp
                                        <option value="">SELECT PAYMENT METHOD</option>

                                        <option value="0">Cash On Delivery</option>
                                        <option value="stripe">Credit Card</option>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Stripe Fields -->
                        <div class="col-md-12" id="stripeCardField" style="display: none;">
                            <div id="card-element" class="form-control"></div>
                            <div id="card-errors" role="alert" style="color: red; margin-top: 10px;"></div>
                        </div>
                        @php
                        $cards = auth()->check()
                        ? App\Models\Card::where('user_id', auth()->id())->with('product_variant')->get()
                        : App\Models\Card::where('session_id',
                        session()->getId())->with('product_variant')->get();

                        $totalPrice = 0;

                        $card = auth()->check()
                        ? App\Models\Card::where('user_id', auth()->id())->with('product_variant')->first()
                        : App\Models\Card::where('session_id',
                        session()->getId())->with('product_variant')->first();

                        $cupon_code = $card ? $card->coupon_code : null;
                        @endphp
                        <input type="hidden" name="cupon_code_id" value="{{$cupon_code}}">

                        <!-- Submit Button -->
                        <div class="col-md-12 m-b25">
                            <button type="submit" class="btn btn-secondary w-100">ORDER NOW</button>
                        </div>

                    </form>

                    <script src="https://js.stripe.com/v3/"></script>
                    <script>
                    const stripe = Stripe(
                        "pk_live_51Qd4C5034LQkef8VkKkDku8lb0sItY7gWqGHzDcbSsymGXTcVeRfMV8yB1DnlGDQ4IgvSNSV9h8o3IpQK6sFBV0400RqQ80ZLu"
                    ); // Replace with your Stripe publishable key
                    const elements = stripe.elements();
                    const card = elements.create('card', {
                        style: {
                            base: {
                                fontSize: '16px'
                            }
                        }
                    });

                    card.mount('#card-element');

                    const form = document.getElementById('checkout-form');

                    form.addEventListener('submit', async (event) => {
                        if (document.querySelector('select[name="payment_method"]').value === 'stripe') {
                            event.preventDefault();

                            const {
                                token,
                                error
                            } = await stripe.createToken(card);

                            if (error) {
                                const errorElement = document.getElementById('card-errors');
                                errorElement.textContent = error.message;
                            } else {
                                const hiddenInput = document.createElement('input');
                                hiddenInput.setAttribute('type', 'hidden');
                                hiddenInput.setAttribute('name', 'stripeToken');
                                hiddenInput.setAttribute('value', token.id);
                                form.appendChild(hiddenInput);

                                form.submit();
                            }
                        }
                    });

                    function togglePaymentFields() {
                        const paymentMethod = document.querySelector('select[name="payment_method"]').value;
                        const stripeField = document.getElementById('stripeCardField');

                        stripeField.style.display = paymentMethod === 'stripe' ? 'block' : 'none';
                    }

                    document.addEventListener('DOMContentLoaded', togglePaymentFields);
                    </script>

                </div>
                <div class="col-xl-4 side-bar">
                    <h4 class="title m-b15">Your Order</h4>
                    <div class="order-detail sticky-top">

                        @php
                        $currencyCode = session('currency', 'SGD');
                        $currency = App\Models\Currency::where('code', $currencyCode)->first();
                        $currencySymbol = $currency->symbol ?? '$';
                        $exchangeRate = $currency->exchange_rate ?? 1;

                        @endphp
                        @php
                        $cards = auth()->check()
                        ? App\Models\Card::where('user_id', auth()->id())->with('product_variant')->get()
                        : App\Models\Card::where('session_id', session()->getId())->with('product_variant')->get();
                        $totalPrice = 0; // Initialize total price
                        @endphp


                        @php

                        $delivery_count = App\Models\Delivery::where("currency",$currencyCode)->count();
                        if($delivery_count >= 1){
                        $delivery = App\Models\Delivery::where("currency",$currencyCode)->first();
                        $deli_price = $delivery->deli_price;
                        $mini_price = $delivery->mini_price;
                        @endphp
                        <div class="icon-bx-wraper style-4 m-b30">
                            <div class="icon-content">

                                <p>
                                <h6 class="dz-title">Delivery Fee </h6>
                                Delivery Fee is {{$deli_price}} {{$currencySymbol}} for orders below
                                {{$mini_price}}
                                {{$currencySymbol}} , <b> over {{$mini_price}} {{$currencySymbol}} is free </b>.
                                </p>
                            </div>
                        </div>
                        @php

                        }
                        @endphp


                        @foreach($cards as $card)
                        @php
                        $variantProductPrice = $card->product_variant->price;
                        $vDiscountType = $card->product_variant->discount_type;
                        $vDiscountAmount = $card->product_variant->discount_amount;

                        // Calculate final price after applying any discount
                        if ($vDiscountType == 0) {
                        $finalPrice = $variantProductPrice;
                        } elseif ($vDiscountType == 1) {
                        $finalPrice = $variantProductPrice - $vDiscountAmount;
                        } elseif ($vDiscountType == 2) {
                        $finalPrice = $variantProductPrice - ($variantProductPrice * ($vDiscountAmount / 100));
                        }

                        // Calculate subtotal for the item based on quantity
                        $subtotal = $finalPrice * $card->qty;
                        $totalPrice += $subtotal; // Add to total price
                        @endphp

                        <div class="cart-item style-1">
                            <div class="dz-media">
                                <!-- Product Image -->
                                <img src="{{ asset($card->product_variant->image) }}" alt="/" class="img-fluid">
                            </div>
                            <div class="dz-info">
                                <!-- Product Name -->
                                <h5><a href="/products/{{ $card->product_variant->product->id }}/detail">{{ $card->product_variant->product->name }}
                                        ( {{ $card->product_variant->attribute_name	 }} -
                                        {{ $card->product_variant->attribute_value }} )</a>
                                </h5>
                                <!-- Final Price (after discount) -->
                                @php
                                $subtotal = $subtotal * $exchangeRate;
                                @endphp
                                <p> &nbsp; QTY: {{ $card->qty }} | SubTotal : {{ number_format($subtotal, 2) }}
                                    {{ $currencySymbol}}</p>

                            </div>
                        </div>
                        @endforeach




                        <table>
                            <tbody>

                                <tr class="delivery">
                                    <td>
                                        <h6 class="mb-0">Delivery Fee</h6>
                                    </td>

                                    <td class="price" style="text-align:right">
                                        @php
                                        $cupon_code = $card ? $card->coupon_code : null;
                                        $original_price = $totalPrice;
                                        $after_discount_price = $totalPrice; // Initialize with the total price

                                        if ($cupon_code) {
                                        $cupon_code_info = App\Models\CuponCode::find($cupon_code);
                                        if ($cupon_code_info) {
                                        $cupon_code_type = $cupon_code_info->type;
                                        $cupon_code_amount = $cupon_code_info->amount;

                                        if ($cupon_code_type == 1) {
                                        $after_discount_price -= $cupon_code_amount;
                                        } elseif ($cupon_code_type == 2) {
                                        $after_discount_price -= ($after_discount_price * ($cupon_code_amount / 100));
                                        }
                                        }
                                        }

                                        // Apply exchange rate
                                        $original_price *= $exchangeRate;
                                        $after_discount_price *= $exchangeRate;

                                        // Determine final order price (with or without coupon)
                                        $order_price = $cupon_code ? $after_discount_price : $original_price;

                                        // Fetch delivery settings
                                        $delivery = App\Models\Delivery::where("currency", session("currency",
                                        "SGD"))->first();
                                        $deliveryFee = 0;

                                        if ($delivery) {
                                        $deliveryFee = ($order_price < $delivery->mini_price) ? $delivery->deli_price :
                                            0;

                                            }
                                            @endphp
                                            <p id="final_deli_fee" style="display:none !important;">{{$deliveryFee}}</p>
                                            @if ($deliveryFee > 0)
                                            {{ number_format($deliveryFee, 2) }} {{ $currencySymbol }}
                                            @else
                                            Delivery Fee is Free
                                            @endif
                                    </td>
                                </tr>

                                <tr class="total">
                                    <td>
                                        <h6 class="mb-0">Total</h6>
                                    </td>

                                    @php
                                    // Add delivery fee to total price
                                    $finalTotal = $order_price + $deliveryFee;
                                    @endphp

                                    <td class="price">
                                        @if ($cupon_code)
                                        <del>{{ number_format($original_price, 2) }} {{ $currencySymbol }}</del>
                                        <br>
                                        {{ number_format($finalTotal, 2) }} {{ $currencySymbol }}
                                        @else
                                        {{ number_format($finalTotal, 2) }} {{ $currencySymbol }}
                                        @endif
                                        ( {{ $currencyCode }} )
                                    </td>
                                </tr>

                                @if($cupon_code != null)
                                <p> Cupon Code : {{$cupon_code_info->cupon_code}}</p>
                                @endif

                            </tbody>
                        </table>


                        @php
                        $cards = auth()->check()
                        ? App\Models\Card::where('user_id', auth()->id())->with('product_variant')->count()
                        : App\Models\Card::where('session_id',
                        session()->getId())->with('product_variant')->count();
                        @endphp
                        @if($cards > 0 )
                        <a href="/cart" class="btn btn-secondary w-100">Edit In Cart</a>
                        @else
                        <a href="/cart" class="btn btn-secondary w-100">Edit In Cart</a>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Icon Box Start -->
    @include("web.product_footer")
    <!-- Icon Box End -->

    <script>
    let delivery_fee = document.getElementById('final_deli_fee').textContent;
    document.getElementById('delivery_fee_input').value = delivery_fee;
    </script>

</div>
@endsection