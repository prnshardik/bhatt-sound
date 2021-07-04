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

    var btnFinish = $('<button></button>').text('Finish').addClass('btn btn-info').attr('id', 'finish')
                                    .on('click', function(){ console.log('finish') });
    
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
            console.log('first');
        } else if(stepPosition === 'forward' && repo == '1'){
            console.log('second');
        } else if(stepPosition === 'forward' && repo == '2'){
            console.log('third');
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