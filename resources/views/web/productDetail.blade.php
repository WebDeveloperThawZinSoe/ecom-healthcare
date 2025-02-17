@extends('web.master')
@section('body')

<style>
.variant-buttons .variant-option {
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.variant-option.active {
    background-color: #007bff;
    color: #fff;
    border-color: #007bff;
}

.variant-group {
    margin-bottom: 10px;
}
</style>
<div class="page-content">

    <div class="d-sm-flex justify-content-between container-fluid py-3">
        <nav aria-label="breadcrumb" class="breadcrumb-row">
            <ul class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="/"> Home</a></li>
                <li class="breadcrumb-item"><a href="/products"> Products</a></li>
                <li class="breadcrumb-item">{{$detail_product->name}}</li>
            </ul>
        </nav>
    </div>

    <section class="content-inner py-0">
        <div class="container-fluid">
            <div class="row">
                <!-- Product Gallery Section -->
                <div class="col-xl-6 col-md-6">
                    <div class="dz-product-detail sticky-top">
                        <div class="swiper-btn-center-lr">
                            <!-- Main Image Display -->
                            <div class="swiper product-gallery-swiper2">
                                <div class="swiper-wrapper" id="lightgallery">
                                    <div class="swiper-slide">
                                        <div class="dz-media DZoomImage">
                                            <a id="mainImageLink" data-lightbox="product-zoom"
                                                href="{{ asset($detail_product->image) }}">
                                                <img id="mainImage" src="{{ asset($detail_product->image) }}"
                                                    alt="{{ $detail_product->name }}">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Additional Images -->
                                    @foreach($detail_product->images ?? [] as $image)
                                    <div class="swiper-slide">
                                        <div class="dz-media DZoomImage">
                                            <a data-lightbox="product-zoom" href="{{ asset($image) }}">
                                                <img src="{{ asset($image) }}" alt="{{ $detail_product->name }}">
                                            </a>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>

                            <!-- Thumbnail Swiper -->
                            <div class="swiper product-gallery-swiper thumb-swiper-lg swiper-vertical">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src="{{ asset($detail_product->image) }}" alt="{{ $detail_product->name }}"
                                            onclick="changeMainImage('{{ asset($detail_product->image) }}')">
                                    </div>
                                    @foreach($detail_product->images ?? [] as $image)
                                    <div class="swiper-slide">
                                        <img src="{{ asset($image) }}" alt="{{ $detail_product->name }}"
                                            onclick="changeMainImage('{{ asset($image) }}')">
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Details Section -->
                <div class="col-xl-6 col-md-6">
                    <div class="dz-product-detail style-2 p-t50">
                        <div class="dz-content">
                            <div class="dz-content-footer">
                                <div class="dz-content-start">
                                    @if($detail_product->discount_type != 0)
                                    <div class="product-tag">
                                        <span class="badge bg-purple mb-2">Sale |
                                            @if($detail_product->discount_type == 1)
                                            {{$detail_product->discount_amount}} $ OFF
                                            @elseif($detail_product->discount_type == 2)
                                            {{$detail_product->discount_amount}} % OFF
                                            @endif
                                        </span>
                                    </div>
                                    @endif
                                    @if($detail_product->pre_order == 1)
                                    <div class="product-tag">
                                        <span class="badge bg-purple mb-2">
                                            Pre Order
                                        </span>
                                    </div>
                                    @endif
                                    <h4 class="title mb-1"><a href="#">{{$detail_product->name}}</a></h4>
                                </div>
                            </div>
                            <p class="para-text">
                                @php
                                $description = strip_tags($detail_product->description);
                                $words = explode(' ', $description);
                                $wordCount = count($words);
                                $truncatedDescription = $wordCount > 100 ? implode(' ', array_slice($words, 0, 100)) .
                                '...' : $description;
                                @endphp
                                {!! $detail_product->short_description !!}
                            </p>
                            <div class="meta-content m-b20 d-flex align-items-end">
                                <div class="me-3">



                                    <label class="form-label">Price</label>

                                    @php
                                    use App\Models\Currency;

                                    // Get selected currency from session (default to 'SGD')
                                    $currencyCode = session('currency', 'SGD');

                                    // Retrieve currency details from the database
                                    $currency = Currency::where('code', $currencyCode)->first();
                                    $currencySymbol = $currency->symbol ?? '$';
                                    $exchangeRate = $currency->exchange_rate ?? 1;
                                    @endphp

                                    <span class="price-num" id="product-price">
                                        @php
                                        if ($detail_product->product_type == 1) {
                                        $price = $detail_product->price * $exchangeRate; // Convert price

                                        if ($detail_product->discount_type == 1) {
                                        $discountPrice = ($detail_product->price - $detail_product->discount_amount) *
                                        $exchangeRate;
                                        $priceDisplay = "<del>{$currencySymbol} " . number_format($price, 2) . "</del>
                                        {$currencySymbol} " . number_format($discountPrice, 2);
                                        } elseif ($detail_product->discount_type == 2) {
                                        $discountPrice = ($detail_product->price - ($detail_product->price *
                                        ($detail_product->discount_amount / 100))) * $exchangeRate;
                                        $priceDisplay = "<del>{$currencySymbol} " . number_format($price, 2) . "</del>
                                        {$currencySymbol} " . number_format($discountPrice, 2);
                                        } else {
                                        $priceDisplay = "{$currencySymbol} " . number_format($price, 2);
                                        }

                                        echo $priceDisplay;
                                        } elseif ($detail_product->product_type == 2) {
                                        $minPrice = $detail_product->variants->min('price') * $exchangeRate;
                                        $maxPrice = $detail_product->variants->max('price') * $exchangeRate;
                                        echo "{$currencySymbol} " . number_format($minPrice, 2) . " ~ {$currencySymbol}
                                        " . number_format($maxPrice, 2);
                                        }
                                        @endphp
                                    </span>


                                </div>
                            </div>


                           @if($detail_product->product_type == 2)
                            @if($detail_product->variants->count() > 0)
                            <div class="product-variants">
                                <label>Select Variant:</label>
                                <div class="variant-buttons d-flex flex-wrap gap-2">
                                    @php
                                    $groupedVariants = $detail_product->variants->groupBy('attribute_name');
                                    @endphp
                                    @foreach($groupedVariants as $attributeName => $variants)
                                    <div class="variant-group">
                                        <h5 class="variant-attribute-name">{{ $attributeName }}</h5>
                                        @foreach($variants as $variant)
                                        @if($variant->stock > 0 && $variant->status == 1)
                                        @php
                                        $variantProductPrice = $variant->price;
                                        $discountType = $variant->discount_type;
                                        $discountAmount = $variant->discount_amount;

                                        // Calculate the price after discount
                                        switch ($discountType) {
                                        case 1: // Fixed amount discount
                                        $variantProductPrice -= $discountAmount;
                                        break;
                                        case 2: // Percentage discount
                                        $variantProductPrice -= $variantProductPrice * ($discountAmount / 100);
                                        break;
                                        default: // No discount
                                        break;
                                        }
                                        // Ensure that the price is numeric for JavaScript
                                        $showPrice = $variantProductPrice;
                                        @endphp

                                        <label class="btn btn-outline-secondary variant-option"
                                            data-price="{{ $variantProductPrice }}"
                                            data-image="{{ asset($variant->image) }}" data-showPrice="{{ $showPrice }}">
                                            <input type="radio" name="product_variant" value="{{ $variant->id }}"
                                                class="d-none">
                                            {{ $variant->attribute_value ?? 'Default' }}
                                        </label>
                                        @endif
                                        @endforeach
                                    </div>

                                    @endforeach

                                </div>
                            </div>
                            @endif
                            @endif

                            <div class="product-num">
                                <div class="btn-quantity light d-xl-block">
                                    <label class="form-label">Quantity</label>
                                    <div class="quantity-control d-flex align-items-center">
                                        <button type="button" class="btn btn-default bootstrap-touchspin-down btn-sm"
                                            id="decrease-qty">-</button> &nbsp;
                                        <input type="text" value="1" min="1" name="qty" id="quantity"
                                            class="form-control-sm mx-2"> &nbsp;
                                        <button type="button" class="btn btn-default bootstrap-touchspin-down btn-sm"
                                            id="increase-qty">+</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Add to Cart Form -->
                            <form method="POST" action="{{ route('cart.add') }}">
                                @csrf
                                @if($detail_product->product_type == 2)
                                <input type="hidden" name="variant_id" id="variant_id">
                                @elseif($detail_product->product_type == 1)
                                        @php 
                                        $varaint_product_id = $detail_product->variants->count() > 0 ? $detail_product->variants->first()->id : null;
                                        @endphp
                                <input type="hidden" name="variant_id" value="{{$varaint_product_id}}">
                                @endif
                                <input type="hidden" name="quantity" id="form-quantity" value="1">
                                <!-- Set initial value -->
                                <div class="btn-group cart-btn">
                                @if($detail_product->product_type == 2)
                                    <button type="submit" class="btn btn-secondary text-uppercase"
                                        id="add-to-cart-btn">Add To Cart</button>
                                @elseif($detail_product->product_type == 1)
                                <button type="submit" class="btn btn-secondary text-uppercase"
                                >Add To Cart</button>

                                @endif
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    @php
    $exchangeRate = isset($exchangeRate) && is_numeric($exchangeRate) ? $exchangeRate : 1;
    @endphp
    <script>
    // JavaScript function to change the main image and update Lightbox link
    function changeMainImage(imageUrl) {
        document.getElementById('mainImage').src = imageUrl;
        document.getElementById('mainImageLink').href = imageUrl;
    }

    // Variant selection event handler
    // document.querySelectorAll('.variant-option').forEach(button => {
    //     button.addEventListener('click', function() {
    //         button.querySelector('input').checked = true;
    //         document.querySelectorAll('.variant-option').forEach(btn => btn.classList
    //             .remove('active'));
    //         button.classList.add('active');

    //         // Update product price based on selected variant
    //         const variantPrice = button.getAttribute('data-price');
    //         const show_price_org = Number(button.getAttribute('data-showPrice'));
    //         console.log("Parsed Original Price:", show_price_org);
    //         // Ensure exchangeRate is properly converted
    //         let exchangeRate = {
    //             {
    //                 is_numeric($exchangeRate) ? $exchangeRate : 1
    //             }
    //         };
    //         console.log("Parsed Exchange Rate:", exchangeRate);

    //         let show_price = show_price_org * exchangeRate;

    //         let currencySymbol = "{{ $currencySymbol }}";
    //         document.getElementById('product-price').innerHTML = show_price.toFixed(2) + " " +
    //             currencySymbol;


    //         // Set the selected variant ID in the hidden form field
    //         document.getElementById('variant_id').value = button.querySelector('input')
    //             .value;

    //         // Update main image based on selected variant's image
    //         const variantImage = button.getAttribute('data-image');
    //         if (variantImage) {
    //             changeMainImage(variantImage);
    //         }
    //     });
    // });

    // Variant selection event handler
document.querySelectorAll('.variant-option').forEach(button => {
    button.addEventListener('click', function() {
        button.querySelector('input').checked = true;
        document.querySelectorAll('.variant-option').forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');

        // Get the numeric value for show_price_org
        const show_price_org = Number(button.getAttribute('data-showPrice')); // This should now be numeric
        console.log("Parsed Original Price:", show_price_org);

        // Ensure exchangeRate is properly converted
        let exchangeRate = {{ is_numeric($exchangeRate) ? $exchangeRate : 1 }};
        console.log("Parsed Exchange Rate:", exchangeRate);

        let show_price = show_price_org * exchangeRate;

        let currencySymbol = "{{ $currencySymbol }}";
        document.getElementById('product-price').innerHTML = show_price.toFixed(2) + " " + currencySymbol;

        // Set the selected variant ID in the hidden form field
        document.getElementById('variant_id').value = button.querySelector('input').value;

        // Update main image based on selected variant's image
        const variantImage = button.getAttribute('data-image');
        if (variantImage) {
            changeMainImage(variantImage);
        }
    });
});




    // Handle quantity increase and decrease
    const quantityInput = document.getElementById('quantity');
    const increaseButton = document.getElementById('increase-qty');
    const decreaseButton = document.getElementById('decrease-qty');

    increaseButton.addEventListener('click', function() {
        let currentQuantity = parseInt(quantityInput.value);
        quantityInput.value = currentQuantity + 1;
        document.getElementById('form-quantity').value = quantityInput.value;
    });

    decreaseButton.addEventListener('click', function() {
        let currentQuantity = parseInt(quantityInput.value);
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
            document.getElementById('form-quantity').value = quantityInput.value;
        }
    });

    // Update form-quantity hidden field when quantity is changed manually
    quantityInput.addEventListener('change', function() {
        document.getElementById('form-quantity').value = this.value;
    });

    // Prevent form submission if variant is not selected
    document.getElementById('add-to-cart-btn').addEventListener('click', function(event) {
        const selectedVariant = document.querySelector('input[name="product_variant"]:checked');
        if (!selectedVariant) {
            event.preventDefault();
            alert('Please select a product variant.');
        }
    });
    </script>




    <section class="content-inner-3 pb-0">
        <div class="container">
            <div class="product-description">
                <div class="dz-tabs">
                    <ul class="nav nav-tabs center" id="myTab1" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                                aria-selected="true">Description</button>
                        </li>

                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
                            aria-labelledby="home-tab" tabindex="0">
                            {!! $detail_product->description !!}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="content-inner-1 overlay-white-middle overflow-hidden">
        <div class="container">
            <div class="section-head style-2">
                <div class="left-content">
                    <h2 class="title mb-0">Related products</h2>
                </div>
            </div>
            <div class="swiper-btn-center-lr">
                <div class="row">
                    <div class="row gx-xl-4 g-3 mb-xl-0 mb-md-0 mb-3">
                        @foreach($suggest_products as $product)
                        <li class="card-container col-6 col-xl-3 col-lg-3 col-md-4 col-sm-6 Begs mt-5">
                            <div class="shop-card">
                                <a href="/products/{{$product->id}}/detail">
                                    <div class="dz-media">
                                        <img src="{{ asset($product->image) }}" alt="{{ $product->name }}"
                                            style="max-height:300px !important" loading="lazy">
                                       
                                    </div>
                                    <div class="dz-content">
                                        <h5 class="title">{{ $product->name }}</h5>
                                        <h6 class="price" style="color:black !important;">
                                            @php
                                            if ($detail_product->product_type == 1) {
                                            $price = $detail_product->price * $exchangeRate; // Convert price

                                            if ($detail_product->discount_type == 1) {
                                            $discountPrice = ($detail_product->price - $detail_product->discount_amount)
                                            *
                                            $exchangeRate;
                                            $priceDisplay = "<del>{$currencySymbol} " . number_format($price, 2) .
                                                "</del>
                                            {$currencySymbol} " . number_format($discountPrice, 2);
                                            } elseif ($detail_product->discount_type == 2) {
                                            $discountPrice = ($detail_product->price - ($detail_product->price *
                                            ($detail_product->discount_amount / 100))) * $exchangeRate;
                                            $priceDisplay = "<del>{$currencySymbol} " . number_format($price, 2) .
                                                "</del>
                                            {$currencySymbol} " . number_format($discountPrice, 2);
                                            } else {
                                            $priceDisplay = "{$currencySymbol} " . number_format($price, 2);
                                            }

                                            echo $priceDisplay;
                                            } elseif ($detail_product->product_type == 2) {
                                            $minPrice = $detail_product->variants->min('price') * $exchangeRate;
                                            $maxPrice = $detail_product->variants->max('price') * $exchangeRate;
                                            echo "{$currencySymbol} " . number_format($minPrice, 2) . " ~
                                            {$currencySymbol}
                                            " . number_format($maxPrice, 2);
                                            }
                                            @endphp
                                        </h6>
                                    </div>
                                    @if($product->discount_type != 0)
                                    <div class="product-tag">
                                        <span class="badge badge-secondary">Sale |
                                            @if($product->discount_type == 1)
                                            {{$product->discount_amount}}
                                            $ OFF
                                            @elseif($product->discount_type == 2)
                                            {{$product->discount_amount}} % OFF
                                            @endif
                                        </span>
                                    </div>
                                    @endif
                                </a>
                            </div>

                        </li>
                        @endforeach


                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Icon Box Start -->
    @include("web.product_footer")
    <!-- Icon Box End -->
</div>
@endsection