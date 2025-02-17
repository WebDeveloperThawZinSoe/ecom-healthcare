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
                      

                            <!-- Country -->
                            <div class="col-md-12">
                                <div class="m-b25">
                                    <label class="label-title">Country *</label>
                                    <div class="form-select">
                                        <select name="country" class="default-select w-100">
                                            <option value="">Select Country</option>
                                            <option value="Afghanistan">Afghanistan</option>
                                            <option value="Albania">Albania</option>
                                            <option value="Algeria">Algeria</option>
                                            <option value="Andorra">Andorra</option>
                                            <option value="Angola">Angola</option>
                                            <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                            <option value="Argentina">Argentina</option>
                                            <option value="Armenia">Armenia</option>
                                            <option value="Australia">Australia</option>
                                            <option value="Austria">Austria</option>
                                            <option value="Azerbaijan">Azerbaijan</option>
                                            <option value="Bahamas">Bahamas</option>
                                            <option value="Bahrain">Bahrain</option>
                                            <option value="Bangladesh">Bangladesh</option>
                                            <option value="Barbados">Barbados</option>
                                            <option value="Belarus">Belarus</option>
                                            <option value="Belgium">Belgium</option>
                                            <option value="Belize">Belize</option>
                                            <option value="Benin">Benin</option>
                                            <option value="Bhutan">Bhutan</option>
                                            <option value="Bolivia">Bolivia</option>
                                            <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                            <option value="Botswana">Botswana</option>
                                            <option value="Brazil">Brazil</option>
                                            <option value="Brunei">Brunei</option>
                                            <option value="Bulgaria">Bulgaria</option>
                                            <option value="Burkina Faso">Burkina Faso</option>
                                            <option value="Burundi">Burundi</option>
                                            <option value="Cabo Verde">Cabo Verde</option>
                                            <option value="Cambodia">Cambodia</option>
                                            <option value="Cameroon">Cameroon</option>
                                            <option value="Canada">Canada</option>
                                            <option value="Central African Republic">Central African Republic</option>
                                            <option value="Chad">Chad</option>
                                            <option value="Chile">Chile</option>
                                            <option value="China">China</option>
                                            <option value="Colombia">Colombia</option>
                                            <option value="Comoros">Comoros</option>
                                            <option value="Congo (Congo-Brazzaville)">Congo</option>
                                            <option value="Costa Rica">Costa Rica</option>
                                            <option value="Croatia">Croatia</option>
                                            <option value="Cuba">Cuba</option>
                                            <option value="Cyprus">Cyprus</option>
                                            <option value="Czechia (Czech Republic)">Czechia</option>
                                            <option value="Democratic Republic of the Congo">Democratic Republic of the
                                                Congo</option>
                                            <option value="Denmark">Denmark</option>
                                            <option value="Djibouti">Djibouti</option>
                                            <option value="Dominica">Dominica</option>
                                            <option value="Dominican Republic">Dominican Republic</option>
                                            <option value="Ecuador">Ecuador</option>
                                            <option value="Egypt">Egypt</option>
                                            <option value="El Salvador">El Salvador</option>
                                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                                            <option value="Eritrea">Eritrea</option>
                                            <option value="Estonia">Estonia</option>
                                            <option value="Eswatini (Swaziland)">Eswatini</option>
                                            <option value="Ethiopia">Ethiopia</option>
                                            <option value="Fiji">Fiji</option>
                                            <option value="Finland">Finland</option>
                                            <option value="France">France</option>
                                            <option value="Gabon">Gabon</option>
                                            <option value="Gambia">Gambia</option>
                                            <option value="Georgia">Georgia</option>
                                            <option value="Germany">Germany</option>
                                            <option value="Ghana">Ghana</option>
                                            <option value="Greece">Greece</option>
                                            <option value="Grenada">Grenada</option>
                                            <option value="Guatemala">Guatemala</option>
                                            <option value="Guinea">Guinea</option>
                                            <option value="Guyana">Guyana</option>
                                            <option value="Haiti">Haiti</option>
                                            <option value="Honduras">Honduras</option>
                                            <option value="Hungary">Hungary</option>
                                            <option value="Iceland">Iceland</option>
                                            <option value="India">India</option>
                                            <option value="Indonesia">Indonesia</option>
                                            <option value="Iran">Iran</option>
                                            <option value="Iraq">Iraq</option>
                                            <option value="Ireland">Ireland</option>
                                            <option value="Israel">Israel</option>
                                            <option value="Italy">Italy</option>
                                            <option value="Jamaica">Jamaica</option>
                                            <option value="Japan">Japan</option>
                                            <option value="Jordan">Jordan</option>
                                            <option value="Kazakhstan">Kazakhstan</option>
                                            <option value="Kenya">Kenya</option>
                                            <option value="Kuwait">Kuwait</option>
                                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                                            <option value="Laos">Laos</option>
                                            <option value="Latvia">Latvia</option>
                                            <option value="Lebanon">Lebanon</option>
                                            <option value="Malaysia">Malaysia</option>
                                            <option value="Maldives">Maldives</option>
                                            <option value="Mexico">Mexico</option>
                                            <option value="Mongolia">Mongolia</option>
                                            <option value="Myanmar">Myanmar</option>
                                            <option value="Nepal">Nepal</option>
                                            <option value="Netherlands">Netherlands</option>
                                            <option value="New Zealand">New Zealand</option>
                                            <option value="Nigeria">Nigeria</option>
                                            <option value="Norway">Norway</option>
                                            <option value="Pakistan">Pakistan</option>
                                            <option value="Philippines">Philippines</option>
                                            <option value="Poland">Poland</option>
                                            <option value="Portugal">Portugal</option>
                                            <option value="Russia">Russia</option>
                                            <option value="Saudi Arabia">Saudi Arabia</option>
                                            <option value="Singapore">Singapore</option>
                                            <option value="South Africa">South Africa</option>
                                            <option value="South Korea">South Korea</option>
                                            <option value="Spain">Spain</option>
                                            <option value="Sweden">Sweden</option>
                                            <option value="Switzerland">Switzerland</option>
                                            <option value="Thailand">Thailand</option>
                                            <option value="United Kingdom">United Kingdom</option>
                                            <option value="United States">United States</option>
                                            <option value="Vietnam">Vietnam</option>
                                            <option value="Zimbabwe">Zimbabwe</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" id="delivery_fee_input" name="delivery_fee">

                            <!-- City -->
                            <div class="col-md-12">
                                <div class="form-group m-b25">
                                    <label class="label-title">City *</label>
                                    <input type="text" name="city" required class="form-control"
                                        value="{{ old('city') }}">
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
                                            <option value="stripe">Stripe</option>

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
                        "pk_test_51QcSLLIbqkytycJ7y40nRkoHrub6sUGpIuYQcfVT1f0T3T0FyRaqWnEZPtAoTlW1Kxccou8BbgCE86xlHJMRZbkl00zAsJRC6x"
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
                        $currencyCode = session('currency', 'USD');
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

                        <div class="icon-bx-wraper style-4 m-b30">
                            <div class="icon-content">
                                <h6 class="dz-title">Delivery Fee </h6>
                                <p>
                                    @php

                                    $delivery = App\Models\Delivery::where("currency",$currencyCode)->first();
                                    $deli_price = $delivery->deli_price;
                                    $mini_price = $delivery->mini_price;
                                    @endphp
                                    Delivery Fee is {{$deli_price}} {{$currencySymbol}} for orders below {{$mini_price}}
                                    {{$currencySymbol}} , <b> over {{$mini_price}} {{$currencySymbol}} is free </b>.
                                </p>
                            </div>
                        </div>

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
                                        "USD"))->first();
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