let obj = {
    user_id: {},
    sub_users: {},
    party_name: '',
    party_address: '',
    inventories: {},
    sub_items: {}
}

$(document).ready(function(){
    $('.select2').select2();

    $('#user_id').change(function(){
        let user_id = $(this).val();
        _users(user_id);
    });
    
    $(document).on('click', '#inventories_pagination .pagination a', function(event){
        event.preventDefault(); 
        var page = $(this).attr('href').split('page=')[1];
        var search = $('#inventories_search').val();
        _inventories(page, search);
    });

    $(document).on('keyup', '#inventories_search', function(event){
        event.preventDefault(); 
        var search = $('#inventories_search').val();
        _inventories(0, search);
    });

    $(document).on('click', '.inventories', function(event){
        var value = $(this).val();
        var name = $(this).data('name');

        if($(this).prop("checked") == true){
            obj.inventories[value] = name;  
        } else {
            if(data.cart_id != ''){
                $.ajax({
                    "url": config.routes.delete_inventories+"?cart_id="+data.cart_id+"&id="+value,
                    "dataType": "json",
                    async: false,
                    cache: false,
                    "type": "Get",
                    success: function (response){
                        if(response.code == 200){
                            delete obj.inventories[value];
                        } else {
                            toastr.error(['Something went wrong, please try again later', 'Error']);
                        }
                    },
                    error: function(response){
                        toastr.error(['Something went wrong, please try again later', 'Error']);
                    }
                });
            }else{
                delete obj.inventories[value];
            }
        }
    });

    $(document).on('click', '#sub_items_pagination .pagination a', function(event){
        event.preventDefault(); 
        var page = $(this).attr('href').split('page=')[1];
        var search = $('#sub_items_search').val();
        _sub_items(page, search);
    });

    $(document).on('keyup', '#sub_items_search', function(event){
        event.preventDefault(); 
        var search = $('#sub_items_search').val();
        _sub_items(0, search);
    });

    $(document).on('click', '.sub_items', function(event){
        $("[class^='sub_item_max_error'],[class*=' sub_item_max_error']" ).html('');

        var value = $(this).val();
        let name = $(this).data('name');

        if($(this).prop("checked") == true){
            var sub_items_quantity = $('#sub_items_quantity_'+value).val();
            var sub_items_quantity_max = $('#sub_items_quantity_'+value).data('max');

            if(sub_items_quantity == '' || sub_items_quantity == 0){
                $('.sub_item_max_error'+value).html('Please enter quantity');
                $(".sw-btn-next").addClass('disabled');
            }

            if(sub_items_quantity > sub_items_quantity_max){
                $('.sub_item_max_error'+value).html('max quantity is '+sub_items_quantity_max);
                $(".sw-btn-next").addClass('disabled');
            }
            var s_obj = {};
            s_obj[name] = sub_items_quantity

            obj.sub_items[value] = s_obj;  
        }else {
            if(data.cart_id != ''){
                $.ajax({
                    "url": config.routes.delete_sub_items+"?cart_id="+data.cart_id+"&id="+value,
                    "dataType": "json",
                    async: false,
                    cache: false,
                    "type": "Get",
                    success: function (response){
                        if(response.code == 200){
                            delete obj.sub_items[value];
                        } else {
                            toastr.error(['Something went wrong, please try again later', 'Error']);
                        }
                    },
                    error: function(response){
                        toastr.error(['Something went wrong, please try again later', 'Error']);
                    }
                });
            } else {
                delete obj.sub_items[value];
            }
        }
    });

    $(document).on('keyup', '.sub_items_quantity', function(event){
        $("[class^='sub_item_max_error'],[class*=' sub_item_max_error']" ).html('');
        var sub_items_quantity = $(this).val();
        var sub_items_quantity_id = $(this).data('id');
        var sub_items_quantity_max = $(this).data('max');

        if(sub_items_quantity > sub_items_quantity_max){
            $('.sub_item_max_error'+sub_items_quantity_id).html('max quantity is '+sub_items_quantity_max);
            $(this).val('');
            $('#sub_items_'+sub_items_quantity_id).attr('checked', false);
            $(".sw-btn-next").addClass('disabled');
            return false;
        }else{
            var name = $('#sub_items_'+sub_items_quantity_id).data('name');
            var s_obj = {};
            s_obj[name] = sub_items_quantity;
            obj.sub_items[sub_items_quantity_id] = s_obj;
            $('#sub_items_'+sub_items_quantity_id).attr('checked', true);
            $(".sw-btn-next").removeClass('disabled');
        }
    });

    var btnFinish = $('<button></button>').text('Finish').addClass('btn btn-info').attr('id', 'finish')
                                    .on('click', function(){
                                        if(data.cart_id != ''){
                                            obj['cart_id'] = data.cart_id
                                        }

                                        $.ajaxSetup({
                                            headers: {
                                              'X-CSRF-Token': $('meta[name="_token"]').attr('content')
                                            }
                                        });
                                        $.ajax({
                                            "url": config.routes.insert,
                                            "dataType": "json",
                                            "type": "post",
                                            "data": {
                                                obj
                                            },
                                            success: function (response){
                                                if(response.code == 200){
                                                    toastr.success(response.message, 'Success');
                                                    setTimeout(function(){ window.location.replace(config.routes.cart); }, 2000);
                                                } else {
                                                    toastr.error(response.message, 'Error');
                                                    setTimeout(function(){ location.reload(); }, 2000);
                                                }
                                            },
                                            error: function(response){
                                                if(response.status === 422) {
                                                    var errors_ = response.responseJSON;
                                                    $.each(errors_, function (key, value) {
                                                        toastr.error(value, 'Error');
                                                    });

                                                    setTimeout(function(){ location.reload(); }, 2000);
                                                }
                                            }
                                        });
                                    });
    
    $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
        var time = 500;

        $('#smartwizard').smartWizard("loader", "show");

        $("#finish").addClass('disabled');

        if(stepPosition === 'first') {
            $("#cancel").addClass('disabled');
        }else{
            $("#cancel").removeClass('disabled');
        }

        var repo = anchorObject.data('repo');

        if(stepPosition === 'forward' && repo == '0'){
            obj.user_id = {}
            var user_id = $("#user_id option:selected").val();
            var name = $("#user_id option:selected").text();

            if(user_id != ''){
                obj.user_id[user_id] = name;
            }

            var sub_users = $('#sub_users').select2('data')
            sub_users.forEach(function(item) {
                obj.sub_users[item.id] = item.text
            });

            obj.party_name = $('#party_name').val();
            obj.party_address = $('#party_address').val();

            $('.user_id, .sub_users, .party_name, .party_address').html('');

            if(jQuery.isEmptyObject(obj.user_id) || jQuery.isEmptyObject(obj.sub_users) || obj.party_name == '' || obj.party_address == ''){
                if(jQuery.isEmptyObject(obj.user_id)){
                    $('.user_id').html('please select user')
                } else if(jQuery.isEmptyObject(obj.sub_users)){
                    $('.sub_users').html('please select sub users')
                } else if(obj.party_name == ''){
                    $('.party_name').html('please enter party name')
                } else if(obj.party_address == ''){
                    $('.party_address').html('please enter party address')
                }
                $('#smartwizard').smartWizard("loader", "hide");
                return false
            }else{
                $('#smartwizard').smartWizard("loader", "hide");
                _inventories(0, '');
                return true;
            }
        } else if(stepPosition === 'forward' && repo == '1'){
            if(jQuery.isEmptyObject(obj.inventories)){
                $('.inventory_error').html('please select inventory')
                $('#smartwizard').smartWizard("loader", "hide");
                return false;
            } else {
                $('.inventory_error').html('')
                $('#smartwizard').smartWizard("loader", "hide");
                _sub_items(0, '')
                return true;
            }
        } else if(stepPosition === 'forward' && repo == '2'){
            if(jQuery.isEmptyObject(obj.sub_items)){
                $('.sub_items_error').html('please select sub items')
                $('#smartwizard').smartWizard("loader", "hide");
                return false;
            } else {
                $('.sub_items_error').html('')
                $('#smartwizard').smartWizard("loader", "hide");
                $("#finish").removeClass('disabled');
                _preview()
                return true;
            }
        }

        $('#smartwizard').smartWizard("loader", "hide");
    });

    $('#smartwizard').smartWizard({
        selected: 0, // Initial selected step, 0 = first step
        theme: 'arrows', // theme for the wizard, related css need to include for other than default theme
        justified: true, // Nav menu justification. true/false
        darkMode: false, // Enable/disable Dark Mode if the theme supports. true/false
        autoAdjustHeight: false, // Automatically adjust content height
        cycleSteps: false, // Allows to cycle the navigation of steps
        backButtonSupport: true, // Enable the back button support
        enableURLhash: true, // Enable selection of the step based on url hash
        transition: {
            animation: 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
            speed: '400', // Transion animation speed
            easing:'' // Transition animation easing. Not supported without a jQuery easing plugin
        },
        toolbarSettings: {
            toolbarPosition: 'bottom', // none, top, bottom, both
            toolbarButtonPosition: 'right', // left, right, center
            showNextButton: true, // show/hide a Next button
            showPreviousButton: true, // show/hide a Previous button
            toolbarExtraButtons: [btnFinish] // Extra buttons to show on toolbar, array of jQuery input/buttons elements
        },
        anchorSettings: {
            anchorClickable: true, // Enable/Disable anchor navigation
            enableAllAnchors: false, // Activates all anchors clickable all times
            markDoneStep: true, // Add done state on navigation
            markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
            removeDoneStepOnNavigateBack: false, // While navigate back done step after active step will be cleared
            enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
        },
        keyboardSettings: {
            keyNavigation: true, // Enable/Disable keyboard navigation(left and right keys are used if enabled)
            keyLeft: [37], // Left key code
            keyRight: [39] // Right key code
        },
        lang: { // Language variables for button
            next: 'Next',
            previous: 'Previous'
        },
        disabledSteps: [], // Array Steps disabled
        errorSteps: [], // Highlight step with errors
        hiddenSteps: [] // Hidden steps
    });

    if(jQuery.isEmptyObject(obj.user_id)){
        $('#smartwizard').smartWizard("reset");
    }
});

function _users(user_id){
    $.ajax({
        "url": config.routes.get_sub_users+'?id='+user_id+"&cart_id="+data.cart_id,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#sub_users').empty();
            
            if(response.code == 200){
                $.each(response.data, function(key, value) {
                    $('#sub_users').append('<option value="'+ value.id +'" data-name="'+ value.name +'">'+ value.name +'</option>');
                });
            }
        },
        error: function(response){
            $('#sub_users').empty();
        }
    });
}

function _inventories(page, search){
    $.ajax({
        "url": config.routes.get_inventories+"?page="+page+"&search="+search+"&obj="+JSON.stringify(obj.inventories)+"&cart_id="+data.cart_id,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#inventories_datatable').html(response.data);
            $('#inventories_pagination').html(response.pagination);

            if(response.cart_items.length !== 0){
                $.each(response.cart_items, function(k, v) {
                    var inventory_id = v.inventory_id;
                    var title = v.title;
                    obj.inventories[inventory_id] = title;
                });
            }
        },
        error: function(response){
            $('#inventories_datatable').html('<td colspan="3" class="text-center"><h3>No data found</h3></td>');
            $('#inventories_pagination').html('');
        }
    });
}

function _sub_items(page, search){
    $.ajax({
        "url": config.routes.get_sub_items+"?page="+page+"&search="+search+"&obj="+JSON.stringify(obj.sub_items)+"&cart_id="+data.cart_id,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#sub_items_datatable').html(response.data);
            $('#sub_items_pagination').html(response.pagination);
            
            if(response.cart_items.length !== 0){
                $.each(response.cart_items, function(k, v) {
                    var sub_item_id = v.sub_item_id;
                    var name = v.name;
                    var quantity = v.quantity;
                    var s_obj = {};
                    s_obj[name] = quantity;

                    obj.sub_items[sub_item_id] = s_obj;
                });
            }
        },
        error: function(response){
            $('#sub_items_datatable').html('<td colspan="4" class="text-center"><h3>No data found</h3></td>');
            $('#sub_items_pagination').html('');
        }
    });
}

function _preview(){
    $('#preview_user').html('<h6>'+obj.user_id[Object.keys(obj.user_id)[0]]+'</h6>');
    $('#preview_party_name').html('<h6>'+obj.party_name+'</h6>');
    $('#preview_party_address').html('<h6>'+obj.party_address+'</h6>');

    var sub_users = '';
    $.each(obj.sub_users, function( index, value ) {
        sub_users += '<h6>'+value+'</h6>';
    });

    var inventories = '';
    $.each(obj.inventories, function( index, value ) {
        inventories += '<h6>'+value+'</h6>';
    });

    var sub_items = '';
    $.each(obj.sub_items, function( index, value ) {
        $.each(value, function( i, v ) {
            if(v != ''){
                sub_items += '<div class="row"><div class="col-sm-6"><h6>'+i+'</h6></div><div class="col-sm-6"><h6>'+v+'</h6></div></div>';
            }
        }); 
    });

    $('#preview_sub_users').html(sub_users);
    $('#preview_inventories').html(inventories);
    $('#preview_sub_items').html(sub_items);
}