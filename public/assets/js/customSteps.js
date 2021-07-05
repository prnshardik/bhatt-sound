let obj = {
    user: {},
    sub_users: {},
    party_name: '',
    party_address: '',
    inventories: {},
    sub_inventories: {}
}

$(document).ready(function(){
    $('.select2').select2();

    _users();

    $('#user').change(function(){
        let id = $(this).val();
        _sub_users(id);
    });

    $(document).on('click', '#inventories_pagination .pagination a', function(event){
        event.preventDefault(); 
        var page = $(this).attr('href').split('page=')[1];
        var search = $('#inventories_search').val();
        _inventories(page, search);
    });

    var btnFinish = $('<button></button>').text('Finish').addClass('btn btn-info disabled').attr('id', 'finish')
                                    .on('click', function(){ console.log('finish') });
    
    $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
        var time = 500;

        $('#smartwizard').smartWizard("loader", "show");

        if(stepPosition === 'first'){
            $("#finish").addClass('disabled');
        }

        var repo = anchorObject.data('repo');

        if(stepPosition === 'forward' && repo == '0'){
            obj.sub_users = {}
            var user = $("#user option:selected").val();
            var name = $("#user option:selected").text();

            if(user != ''){
                obj.user[user] = name;
            }

            var sub_users = $('#sub_users').select2('data')
            sub_users.forEach(function(item) {
                obj.sub_users[item.id] = item.text
            });

            obj.party_name = $('#party_name').val();
            obj.party_address = $('#party_address').val();

            $('.user_id, .sub_users, .party_name, .party_address').html('');

            if(jQuery.isEmptyObject(obj.user) || jQuery.isEmptyObject(obj.sub_users) || obj.party_name == '' || obj.party_address == ''){
                if(jQuery.isEmptyObject(obj.user)){
                    $('.user').html('please select user')
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
                console.log(obj);
                _inventories(0, '');
                return true;
            }

        } else if(stepPosition === 'forward' && repo == '1'){
            console.log('second');
        } else if(stepPosition === 'forward' && repo == '2'){
            console.log('third');
            $("#finish").removeClass('disabled');
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

    if(jQuery.isEmptyObject(obj.user)){
        $('#smartwizard').smartWizard("reset");
    }
});

function _users(){
    $.ajax({
        "url": config.routes.users,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            if(response.code == 200){
                $('#user').html(response.data);            
            }else{
                $('#user').html('<option value="">Select user</option>');            
            }
        },
        error: function(response){
            $('#user').html('<option value="">Select user</option>'); 
        }
    });
}

function _sub_users(id){
    $.ajax({
        "url": config.routes.sub_users+'?id='+id,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#sub_users').empty();
            
            if(response.code == 200){
                $('#sub_users').html(response.data);            
            }else{
                $('#sub_users').html('');            
            }
        },
        error: function(response){
            $('#sub_users').empty();
        }
    });
}

function _inventories(page, search){
    $.ajax({
        "url": config.routes.inventories+"?page="+page+"&search="+search,
        "dataType": "json",
        "type": "Get",
        success: function (response){
            $('#inventories_datatable').html(response.data);
            $('#inventories_pagination').html(response.pagination);
        },
        error: function(response){
            $('#inventories_datatable').html('<td colspan="3" class="text-center"><h3>No data found</h3></td>');
            $('#inventories_pagination').html('');
        }
    });
}