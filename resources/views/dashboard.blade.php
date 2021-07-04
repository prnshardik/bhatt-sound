@extends('layout.app')

@section('meta')
@endsection

@section('title')
    Dashboard
@endsection

@section('styles')
    <style>
        .anchor_color{
            color: #66615b;
        }

        .anchor_color:hover{
            color: #66615b;
            text-decoration: none
        }

        .span_class{
            font-size: 1rem;
            font-weight: 500;
        }

        .card-stats .card-body .numbers .card-category {
            font-size: 13px;
        }
    </style>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('users') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-users text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Users</p>
                                <p class="card-title">{{ $data['users'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('items.categories') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-bars text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Items Categories</p>
                                <p class="card-title">{{ $data['itemsCategories'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('items') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-cubes text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Items</p>
                                <p class="card-title">{{ $data['items'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('items.inventories') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-music text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Items Inventories</p>
                                <p class="card-title">{{ $data['itemsInventories'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="#" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-shopping-cart text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Cart</p>
                                <p class="card-title">{{ $data['cart'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('sub.items.categories') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-bars text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Sub Items Categories</p>
                                <p class="card-title">{{ $data['subItemsCategories'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('sub.items') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-cubes text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Sub Items</p>
                                <p class="card-title">{{ $data['items'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('sub.items.inventories') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-music text-warning"></i>
                            </div>
                        </div>
                        <div class="col-9 col-md-9">
                            <div class="numbers">
                                <p class="card-category">Sub Items Inventories</p>
                                <p class="card-title">{{ $data['subItemsInventories'] ?? 0 }}<p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
@endsection