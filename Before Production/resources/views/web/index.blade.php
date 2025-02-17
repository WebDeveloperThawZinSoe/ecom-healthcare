@extends('web.master')
@section('body')
<style>
@media (max-width: 768px) {
    #carouselExample .carousel-item img {
        height: 400px;
        /* Adjust height as needed */
        object-fit: cover;
        /* Ensures the image covers the set height */
    }
}

@media (min-width: 768px) {
    #carouselExample .carousel-item img {
        height: 600px;
        /* Adjust height as needed */
        object-fit: cover;
        /* Ensures the image covers the set height */
    }
}
</style>



<style>
marquee {
    background-color: #f5f5f5;
    color: #333;
    font-size: 18px;
    padding: 10px 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    font-weight: 500;
}
</style>
<style>
/* Hide <br> on screens smaller than 992px (tablet and mobile) */
@media (max-width: 992px) {
    .hide-on-mobile {
        display: none;
    }
}
</style>
<div class="page-content bg-white">
    @php
    $photos = App\Models\Gallery::orderBy("sort","desc")->get();
    //$photo = $photos->image;
    @endphp
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            @foreach($photos as $key => $photo)
            <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                <img src="{{ asset($photo->image) }}" class="d-block w-100" alt="Image {{ $key + 1 }}">
            </div>
            @endforeach

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <marquee behavior="scroll" direction="left" scrollamount="6" class="marquee-container">
        🚚 Enjoy Free Shipping Across Malaysia & Singapore! ✨ Min. Spend RM80 💳 Shop Now & Save More!
    </marquee>


    <!--Recommend Section Start-->
    <section class="content-inner-1 ">
        <div class="container">
            <div class="row">

                <div class="col-xl-12">
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <h3 class="title">Our Latest products</h3>
                        <div class="site-filters clearfix d-flex align-items-center">

                            <a href="/products"
                                class="product-link text-secondary font-14 d-flex align-items-center gap-1 text-nowrap">See
                                all products
                                <i class="icon feather icon-chevron-right font-18"></i>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix">
                        <ul id="masonry" class="row g-xl-4 g-3">
                            @foreach($Latest_products as $product)
                            <li class="card-container col-6 col-xl-3 col-lg-3 col-md-4 col-sm-6 Begs mt-5">
                                <div class="shop-card">
                                    <a href="/products/{{$product->id}}/detail">
                                        <div class="dz-media">
                                            <img src="{{ asset($product->image) }}" alt="{{ $product->name }}"
                                                style="max-height:300px !important" loading="lazy">

                                        </div>
                                        <div class="dz-content">
                                            <h5 class="title">{{ $product->name }}</h5>
                                            @php
                                            $currencyCode = session('currency', 'USD');
                                            $currency = App\Models\Currency::where('code', $currencyCode)->first();
                                            $currencySymbol = $currency->symbol ?? '$';
                                            $exchangeRate = $currency->exchange_rate ?? 1;
                                            @endphp
                                            <h6 class="price" style="color:black !important;">
                                                @if($product->product_type == 1)
                                                @if($product->discount_type == 0)
                                                {{ $currencySymbol }}
                                                {{ number_format($product->price * $exchangeRate, 2) }}
                                                @elseif($product->discount_type == 1)
                                                @php
                                                $discountPrice = ($product->price - $product->discount_amount) *
                                                $exchangeRate;
                                                @endphp
                                                <del>{{ $currencySymbol }}
                                                    {{ number_format($product->price * $exchangeRate, 2) }}</del>
                                                {{ $currencySymbol }} {{ number_format($discountPrice, 2) }}
                                                @elseif($product->discount_type == 2)
                                                @php
                                                $discountPrice = ($product->price - ($product->price *
                                                ($product->discount_amount / 100))) * $exchangeRate;
                                                @endphp
                                                <del>{{ $currencySymbol }}
                                                    {{ number_format($product->price * $exchangeRate, 2) }}</del>
                                                {{ $currencySymbol }} {{ number_format($discountPrice, 2) }}
                                                @endif
                                                @elseif($product->product_type == 2)
                                                @php
                                                $minPrice = $product->variants->min('price') * $exchangeRate;
                                                $maxPrice = $product->variants->max('price') * $exchangeRate;
                                                @endphp
                                                {{ $currencySymbol }} {{ number_format($minPrice, 2) }} ~
                                                {{ $currencySymbol }} {{ number_format($maxPrice, 2) }}
                                                @endif

                                            </h6>
                                        </div>
                                        @if($product->discount_type != 0)
                                        <div class="product-tag">
                                            <span class="badge badge-secondary">Sale |
                                                @if($product->discount_type == 1)
                                                {{$product->discount_amount}} $ OFF
                                                @elseif($product->discount_type == 2)
                                                {{$product->discount_amount}} % OFF
                                                @endif
                                            </span>
                                        </div>
                                        @endif
                                        @if($product->pre_order == 1)
                                        <div class="product-tag">
                                            <span class="badge badge-info">
                                                Pre Order
                                            </span>
                                        </div>
                                        @endif
                                    </a>
                                </div>

                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Recommend Section End-->

    <!-- Feature Box -->
    <section class="content-inner">
        <div class="container">
            <h2>Some Brands On Our Plantform</h2>
            <br>
            <div class="row">


                @foreach($brands as $brand)
                <div class="col-lg-2 col-md-3 col-sm-4 col-4 wow fadeInUp" data-wow-delay="0.1s">
                    <a href="/brands/{{$brand->id}}">
                        <div class="gift-bx">
                            <div class="gift-media">
                                <img src="{{ asset('images/brands/' . $brand->icon) }}" loading="lazy" alt="">
                            </div>
                        </div>
                    </a>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!-- Feature Box End -->



    <!-- Newsletter -->
    <section class="newsletter-wrapper style-1">
        <div class="container">
            <div class="subscride-inner">
                <div
                    class="row style-1 justify-content-xl-between justify-content-lg-center align-items-center text-xl-start text-center">
                    <div class="col-xl-6 col-lg-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div
                            class="d-flex align-items-center justify-content-center justify-content-xl-start mb-3 mb-xl-0 flex-column flex-xl-row">
                            <img class="me-4" src="{{asset('web/images/svg/chat.svg')}}" alt="">
                            <div class="section-head mb-0">
                                <h3 class="title text-white">SUBSCRIBE TO OUR NEWSLETTER</h3>
                                <p class="sub-title text-white">Get latest news, offers and discounts.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 wow fadeInUp" data-wow-delay="0.2s">
                        <form class="dzSubscribe" action="https://mooncart.dexignzone.com/xhtml/script/mailchamp.php"
                            method="post">
                            <div class="dzSubscribeMsg"></div>
                            <div class="form-group">
                                <div class="input-group mb-0">
                                    <input name="dzEmail" required="required" type="email" class="form-control"
                                        placeholder="Your Email Address">
                                    <div class="input-group-addon">
                                        <button name="submit" value="Submit" type="submit" class="btn">
                                            <svg width="21" height="21" viewBox="0 0 21 21" fill="none">
                                                <path d="M4.20972 10.7344H15.8717" stroke="#0D775E" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round" />
                                                <path d="M10.0408 4.90112L15.8718 10.7345L10.0408 16.5678"
                                                    stroke="#0D775E" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Newsletter End -->

    <br class="hide-on-mobile">

    <!-- Get In Touch -->
    <section class="get-in-touch wow" data-wow-delay="0.3s">
        <div class="m-r100 m-md-r0 m-sm-r0">
            <h3 class="dz-title mb-lg-0 mb-3">Questions ?
                <span>Our experts will help find the grar that’s right for you</span>
            </h3>
        </div>
        <a href="/faq" class="btn btn-light">Get In Touch</a>
    </section>
    <!-- Get In Touch End -->

</div>

@endsection