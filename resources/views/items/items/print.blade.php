@extends('layout.app')

@section('meta')
@endsection

@section('title')
    Print QR Code
@endsection

@section('styles')
    <style>
        @media print{
            #printDivStyle{
                display: flex;
                justify-content: center;
                align-items: center;
                height: 90vh;
            }
        }
    </style>
@endsection

@section('content')
    <div class="row" id="printableArea">
        <div class="col-md-12">
            <div class="card ">
                <div class="card-body ">
                        <div class="row">
                            <div class="form-group col-sm-12" id="printDivStyle">
                                @if(isset($data) && !empty($data->qrcode))
                                    <div class="text-center" id="printableArea">
                                        <img id="image" src="{{ url('uploads/qrcodes/items').'/'.$data->qrcode }}" alt="{{ $data->qrcode }}" class="ml-2" style="width: 250px; height: 250px" >
                                        <div class="text-center">
                                            <br>
                                            <h1>{{ $data->name }}</h1>
                                        </div>
                                    </div>

                                        <div class="form-group col-md-3">
                                            <label for="height">Height:</label>
                                            <input type="text" name="height" class="form-control height">
                                        </div>

                                        <div class="form-group col-md-3">
                                            <label for="Width">Width:</label>
                                            <input type="text" name="width" class="form-control width">
                                        </div>
                                        
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                @if(isset($data) && !empty($data->qrcode))
                    <input type="button" class="btn btn-primary" style="cursor:pointer" onclick="printDiv('printableArea')" value="Print" />
                @endif
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        function printDiv(divName) {
            
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
           
            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
    </script>
@endsection

