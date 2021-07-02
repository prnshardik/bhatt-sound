let items = [];

$(document).ready(function(){
    $(document).on('click', '#items_pagination .pagination a', function(event){
        event.preventDefault(); 
        var page = $(this).attr('href').split('page=')[1];
        var search = $('#items_search').val();
        _items(page, search);
    });

    $(document).on('keyup', '#items_search', function(event){
        event.preventDefault(); 
        var search = $('#items_search').val();
        _items(0, search);
    });

    _items(0, '');

    $(document).on('click', '.items', function(event){
        var value = $(this).val();
        
        if($(this).prop("checked") == true){
            items.push(value); 
        } else {
            items = jQuery.grep(items, function(v) {
                return v != value;
            });
            // if(data.cart_id != ''){
                // $.ajax({
                //     "url": config.routes.delete_inventories+"?cart_id="+data.cart_id+"&id="+value,
                //     "dataType": "json",
                //     async: false,
                //     cache: false,
                //     "type": "Get",
                //     success: function (response){
                //         if(response.code == 200){
                            // delete items[value];
                //         } else {
                //             toastr.error(['Something went wrong, please try again later', 'Error']);
                //         }
                //     },
                //     error: function(response){
                //         toastr.error(['Something went wrong, please try again later', 'Error']);
                //     }
                // });
            // }else{
            //     delete obj.inventories[value];
            // }
        }

        _items_ids()
    });
});

function _items_ids(){	
    $(".items_id").remove();
    $.each(items, function(key, value){
        $('#form').append('<input type="hidden" class="items_id" name="items_id[]" value="'+value+'" />');
    })
}

function _items(page, search){
    $.ajax({
        "url": config.routes.inventories_items+"?page="+page+"&search="+search+"&items="+JSON.stringify(items),
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#items_datatable').html(response.data);
            $('#items_pagination').html(response.pagination);
        },
        error: function(response){
            $('#items_datatable').html('<td colspan="3" class="text-center"><h3>No data found</h3></td>');
            $('#items_pagination').html('');
        }
    });
}