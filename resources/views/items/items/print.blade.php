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
                    <input type="button" class="btn btn-primary" style="cursor:pointer" onclick="printDiv('printableArea' , 10)" value="Print Small" />
                    <input type="button" class="btn btn-primary" style="cursor:pointer" onclick="printDiv('printableArea' ,20)" value="Print Medium" />
                    <input type="button" class="btn btn-primary" style="cursor:pointer" onclick="printDiv('printableArea' ,30)" value="Print Large" />
                @endif
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        function printDiv(divName , val) {
             if(val == 10){
                $('#image').attr("style", "height: 100px;");
                $('#image').attr("style", "width: 100px;");
            }else if(val == 20){
                $('#image').attr("style", "height: 250px;");
                $('#image').attr("style", "width: 250px;");
            }else if(val == 30){
                $('#image').attr("style", "height: 500px;");
                $('#image').attr("style", "width: 500px;");
            }
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
           
            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;

            $('#image').attr("style", "height: 250px;");
            $('#image').attr("style", "width: 250px;");
        }
    </script>
@endsection

