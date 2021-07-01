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
    </style>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-stats">
            <div class="card-body ">
                <a href="{{ route('users') }}" class="anchor_color">   
                    <div class="row">
                        <div class="col-5 col-md-4">
                            <div class="icon-big text-center icon-warning">
                                <i class="fa fa-users text-warning"></i>
                            </div>
                        </div>
                        <div class="col-7 col-md-8">
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
</div>
@endsection

@section('scripts')
@endsection