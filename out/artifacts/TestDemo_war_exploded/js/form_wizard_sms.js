/* ------------------------------------------------------------------------------
 *
 *  # Steps wizard
 *
 *  Demo JS code for form_wizard.html page
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------
var campvalid1 = false;
var campvalid2 = false;

var FormWizard = function () {

    var grouplist = '';
    var grouplist1 = '';
    var page3valid = false;


    var mobitel = [];
    var airtel = [];
    var hutch = [];
    var dialog = [];
    var other = [];

    var mobitelsum = 0;
    var airtelsum = 0;
    var hutchsum = 0;
    var dialogsum = 0;
    var othersum = 0;


    //
    // Setup module components
    //

    // Wizard
    var _componentWizard = function () {
        if (!$().steps) {
            console.warn('Warning - steps.min.js is not loaded.');
            return;
        }

        // Basic wizard setup
        $('.steps-basic').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            transitionEffect: 'fade',
            titleTemplate: '<span class="number">#index#</span> #title#',
            labels: {
                previous: '<i class="icon-arrow-left13 mr-2" /> Previous',
                next: 'Next <i class="icon-arrow-right14 ml-2" />',
                finish: 'Submit form <i class="icon-arrow-right14 ml-2" />'
            },
            onFinished: function (event, currentIndex) {
                alert('Form submitted.');
            }
        });

        // Async content loading
        $('.steps-async').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            transitionEffect: 'fade',
            titleTemplate: '<span class="number">#index#</span> #title#',
            loadingTemplate: '<div class="card-body text-center"><i class="icon-spinner2 spinner mr-2"></i>  #text#</div>',
            labels: {
                previous: '<i class="icon-arrow-left13 mr-2" /> Previous',
                next: 'Next <i class="icon-arrow-right14 ml-2" />',
                finish: 'Submit form <i class="icon-arrow-right14 ml-2" />'
            },
            onContentLoaded: function (event, currentIndex) {
                $(this).find('.card-body').addClass('hide');

                // Re-initialize components
                _componentSelect2();
                _componentUniform();
            },
            onFinished: function (event, currentIndex) {
                alert('Form submitted.');
            }
        });

        // Saving wizard state
        $('.steps-state-saving').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            titleTemplate: '<span class="number">#index#</span> #title#',
            labels: {
                previous: '<i class="icon-arrow-left13 mr-2" /> Previous',
                next: 'Next <i class="icon-arrow-right14 ml-2" />',
                finish: 'Submit form <i class="icon-arrow-right14 ml-2" />'
            },
            transitionEffect: 'fade',
            saveState: true,
            autoFocus: true,
            onFinished: function (event, currentIndex) {
                alert('Form submitted.');
            }
        });

        // Specify custom starting step
        $('.steps-starting-step').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            titleTemplate: '<span class="number">#index#</span> #title#',
            labels: {
                previous: '<i class="icon-arrow-left13 mr-2" /> Previous',
                next: 'Next <i class="icon-arrow-right14 ml-2" />',
                finish: 'Submit form <i class="icon-arrow-right14 ml-2" />'
            },
            transitionEffect: 'fade',
            startIndex: 2,
            autoFocus: true,
            onFinished: function (event, currentIndex) {
                alert('Form submitted.');
            }
        });

        // Enable all steps and make them clickable
        $('.steps-enable-all').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            transitionEffect: 'fade',
            enableAllSteps: true,
            titleTemplate: '<span class="number">#index#</span> #title#',
            labels: {
                previous: '<i class="icon-arrow-left13 mr-2" /> Previous',
                next: 'Next <i class="icon-arrow-right14 ml-2" />',
                finish: 'Submit form <i class="icon-arrow-right14 ml-2" />'
            },
            onFinished: function (event, currentIndex) {
                alert('Form submitted.');
            }
        });


        //
        // Wizard with validation
        //

        // Stop function if validation is missing
        if (!$().validate) {
            console.warn('Warning - validate.min.js is not loaded.');
            return;
        }

        // Show form
        var form = $('.steps-validation').show();


        // Initialize wizard
        $('.steps-validation').steps({
            headerTag: 'h6',
            bodyTag: 'fieldset',
            titleTemplate: '<span class="number">#index#</span> #title#',
            labels: {
                previous: `<i class="icon-arrow-left13 mr-2" ></i><span style="font-family: 'Poppins',sans-serif;"> PREVIOUS</span>`,
                next: `<span style="font-family: 'Poppins',sans-serif;">NEXT</span><i class="icon-arrow-right14 ml-2" ></i>`,
                finish: `<span style="font-family: 'Poppins',sans-serif;">SEND</span><i class="icon-arrow-right14 ml-2" ></i>`
            },
            transitionEffect: 'fade',
            autoFocus: true,
            onStepChanging: function (event, currentIndex, newIndex) {
                grouplist1 = '';

                // Allways allow previous action even if the current form is not valid!
                if (currentIndex > newIndex) {
                    mobitelsum = 0;
                    airtelsum = 0;
                    dialogsum = 0;
                    othersum = 0;
                    hutchsum = 0;
                    return true;
                }

                // Needed in some cases if the user went back (clean up)
                if (currentIndex < newIndex) {

                    if (selectedMessageType == '') {
                        $('#campaignselecterror').show();
                        return false;
                    } else {
                        $('#campaignselecterror').hide();
                    }



                    if (selectedMessageType == 'ssmst'||selectedMessageType == 'ssmsp') {


                        if(newIndex===2||newIndex===3){

                            if($('#msisdn').val().trim().length==0){
                                swal({
                                    title: 'Please Enter Mobile No',
                                    type:'error',
                                    buttonsStyling: false,
                                    confirmButtonClass: 'btn btn-danger',
                                    cancelButtonClass: 'btn btn-light'
                                });
                                return false;
                            }


                            const regex = /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\d)\d{6}$/;
                            const input= $('#msisdn').val();
                            let matches;
                            matches= regex.exec(input);
                            if(matches==null){

                                swal({
                                    title: 'Please Enter Valid Mobile No',
                                    type:'error',
                                    buttonsStyling: false,
                                    confirmButtonClass: 'btn btn-danger',
                                    cancelButtonClass: 'btn btn-light'
                                });
                                return false;
                            }
                            if($('#messageText').val().trim().length===0){
                                swal({
                                    title: 'Message Cannot Be Empty',
                                    type:'error',
                                    buttonsStyling: false,
                                    confirmButtonClass: 'btn btn-danger',
                                    cancelButtonClass: 'btn btn-light'
                                });
                                return false;
                            }

                            if(selectedMessageType == 'ssmsp'){

                                var radioValue = $("input[name='optOutOption']:checked").val();
                                if(radioValue == 'browseOptOut'){
                                    if($('#browseCustomMessageTextArea').val().trim().length===0){
                                        swal({
                                            title: 'Reminder!',
                                            text: 'You are Not Added Optout Custom Message',
                                            type:'warning',
                                            buttonsStyling: false,
                                            confirmButtonClass: 'btn btn-warning',
                                            cancelButtonClass: 'btn btn-light'
                                        });
                                    }
                                }

                            }

                            console.log(matches);
                        }

                    } else if (selectedMessageType == 'bsmst'||selectedMessageType == 'bsmsp') {

                        //$('#messageText').prop('required', true);

                        if(newIndex===1||newIndex===2||newIndex===3){
                            if($('#campaignName').val().trim().length==0){
                                swal({
                                    title: 'Campaign Name Cannot Be Empty',
                                    type:'error',
                                    buttonsStyling: false,
                                    confirmButtonClass: 'btn btn-danger',
                                    cancelButtonClass: 'btn btn-light'
                                });
                                return false;
                            }
                        }

                        if(newIndex===2||newIndex===3){
                            if($('#messageText').val().trim().length===0){
                                swal({
                                    title: 'Message Cannot Be Empty',
                                    type:'error',
                                    buttonsStyling: false,
                                    confirmButtonClass: 'btn btn-danger',
                                    cancelButtonClass: 'btn btn-light'
                                });
                                return false;
                            }




                        }

                        if(newIndex===2){
                            if(selectedMessageType == 'bsmsp'){

                                var radioValue = $("input[name='optOutOption']:checked").val();
                                if(radioValue == 'browseOptOut'){
                                    if($('#browseCustomMessageTextArea').val().trim().length===0){
                                        swal({
                                            title: 'Reminder!',
                                            text: 'You are Not Added Optout Custom Message',
                                            type:'warning',
                                            buttonsStyling: false,
                                            confirmButtonClass: 'btn btn-warning',
                                            cancelButtonClass: 'btn btn-light'
                                        });
                                    }
                                }

                            }
                        }

                        //number list
                        if (newIndex === 3) {

                            $('#numberselecterror').hide();
                            var rows = $('#numberTable tbody tr').length;
                            var cheked = 0;
                            var notchecked = 0;
                            $("#numberTable [type=checkbox]").each(function (i, chk) {
                                if (chk.checked) {
                                    cheked++;
                                } else {
                                    notchecked++;
                                    page3valid = false;
                                }

                            });
                        }


                        if (cheked == 0) {
                            $('#numberselecterror').show();
                            page3valid = true;
                        } else {
                            $('#numberselecterror').hide();
                            mobitel = [];
                            airtel = [];
                            hutch = [];
                            etisalat = [];
                            dialog = [];
                            other = [];

                            $("#numberTable input[type=checkbox]:checked").each(function () {
                                var row = $(this).closest("tr")[0];
                                // mobitel
                                mobitel.push(parseInt(row.cells[4].innerHTML));
                                // <%--airtel--%>
                                airtel.push(parseInt(row.cells[5].innerHTML));
                                // <%--hutch--%>
                                hutch.push(parseInt(row.cells[6].innerHTML));
                                // <%--dialog--%>
                                dialog.push(parseInt(row.cells[7].innerHTML));
                                // <%--other--%>
                                other.push(parseInt(row.cells[8].innerHTML));
                            });


                            mobitel.forEach(function (m) {
                                mobitelsum += m;
                                $('#mobiteltd').html(mobitelsum);
                            });
                            airtel.forEach(function (a) {
                                airtelsum += a;
                                $('#airteltd').html(airtelsum);
                            });
                            hutch.forEach(function (h) {
                                hutchsum += h;
                                $('#hutchtd').html(hutchsum);
                            });
                            dialog.forEach(function (d) {
                                dialogsum += d;
                                $('#dialogtd').html(dialogsum);
                            });
                            other.forEach(function (o) {
                                othersum += o;
                                $('#othertd').html(othersum);
                            });
                            page3valid = false;
                        }


                        if (page3valid) {
                            return false;
                        }

                    } else if (selectedMessageType == 'tsmst'||selectedMessageType == 'tsmsp') {
                        $('#campaignName').prop('required', true);
                        $('#messageText').prop('required', true);

                    }


                    // To remove error styles
                    form.find('.body:eq(' + newIndex + ') label.error').remove();
                    form.find('.body:eq(' + newIndex + ') .error').removeClass('error');
                }


                console.log(newIndex);
                if(newIndex===1){
                    if(campvalid1){
                        return false;
                    }
                    if(campvalid2){
                        return false;
                    }

                }




                //table list
                $("#numberTable input[type=checkbox]:checked").each(function () {
                    var row = $(this).closest("tr")[0];
                    console.log(row.cells[2].innerHTML);
                    grouplist1 += row.cells[3].innerHTML + ',';
                });

                var a = [];
                var ff = grouplist1.replace(/\s/g, '');
                var sum = 0;
                var total = 0;
                ff.trim().split(',').forEach(function (i) {
                    a.push(parseInt(i));
                });
                const newArray = a.filter(function (value) {
                    return !Number.isNaN(value);
                });
                newArray.forEach(function (ii) {
                    sum += (parseInt(ii));
                    total = sum * $('#cost').text();

                });
                var s = $('#credit').html();
                s = s.replace(',','');
                var sums=  parseFloat(s) - total;
                console.log(sums);
                $('#reqcredit').html(numberWithCommas(total));
                $('#aftercredit').html(numberWithCommas(sums));


                form.validate().settings.ignore = ':disabled,:hidden';
                return form.valid();
            },
            onFinishing: function (event, currentIndex) {
                form.validate().settings.ignore = ':disabled';
                return form.valid();
            },
            onFinished: function (event, currentIndex) {
                $("#numberTable input[type=checkbox]:checked").each(function () {
                    var row = $(this).closest("tr")[0];
                    grouplist += row.cells[1].innerHTML + ',';
                    console.log(row.cells[1].innerHTML);

                });

                $('#groupids').val(grouplist);

                //$('#formcomposesms').unbind().submit();

                var str = $('#messageText').val();

                var uni = hasUnicode(str);

                if (uni === true) {
                    $('#unicodeInput').val('UNICODE');
                } else {
                    $('#unicodeInput').val('NONUNICODE');
                }

                $('#optcustxtinput').val($('#browseCustomMessageTextArea').val());

                $('#costtxtinput').val($('#cost').text());


                var path=$('#context_path').val();

                var msgtxt = $('#messageText').val();

                var msg = msgtxt.split('https://bro.ws/');

                if(msg.length<=2){


                    swal({
                        title: 'Sending...!',
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: false,
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-primary',
                        cancelButtonClass: 'btn btn-light',
                        onOpen: () => {
                            swal.showLoading();
                            $('.swal2-actions').html('<div class="spinner-box"><div class="circle-border" style=" background: linear-gradient(0deg, rgba(255, 134, 0, 0.1) 33%, rgb(255, 134, 0) 100%);"><div class="circle-core"></div> </div> </div>');
                            ///
                            $.ajax(path+'controller/SMSController.jsp', {
                                type: "POST",
                                data: $('#formcomposesms').serialize(),
                                success: function (data) {

                                    console.log(data);

                                    if(data){
                                        swal.hideLoading();
                                        swal({
                                            title: 'Message Submitted!',
                                            text: 'Started Sending to Message to Number List',
                                            type: 'success',
                                            buttonsStyling: false,
                                            confirmButtonClass: 'btn btn-primary',
                                            cancelButtonClass: 'btn btn-light'
                                        }).then(() => {
                                            window.location.replace("sendMessage.jsp");
                                        });
                                    }else{
                                        swal.hideLoading();
                                        swal({
                                            title: 'Credit is Enough!',
                                            text: '',
                                            type: 'error',
                                            buttonsStyling: false,
                                            confirmButtonClass: 'btn btn-danger',
                                            cancelButtonClass: 'btn btn-light'
                                        }).then(() => {

                                        });
                                    }

                                },
                                error: function () {
                                }
                            });

                            //
                        }
                    });


                }else{
                    swal({
                        title: "Multiple Shorted URL(bro.ws)",
                        text:"Can't Use Multiple Shorted URL(bro.ws)",
                        type:'error',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-danger',
                        cancelButtonClass: 'btn btn-light'
                    });
                }

                // form.submit();
            }
        });

        //hide check no list
        $('#numberTable tr').click(function () {
            page3valid = false;
            $('#numberselecterror').hide();

        });


        // Initialize validation
        $('.steps-validation').validate({
            ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
            errorClass: 'validation-invalid-label',
            highlight: function (element, errorClass) {
                $(element).removeClass(errorClass);
            },
            unhighlight: function (element, errorClass) {
                $(element).removeClass(errorClass);
            },

            // Different components require proper error label placement
            errorPlacement: function (error, element) {

                // Unstyled checkboxes, radios
                if (element.parents().hasClass('form-check')) {
                    error.appendTo(element.parents('.form-check').parent());
                }

                // Input with icons and Select2
                else if (element.parents().hasClass('form-group-feedback') || element.hasClass('select2-hidden-accessible')) {
                    error.appendTo(element.parent());
                }

                // Input group, styled file input
                else if (element.parent().is('.uniform-uploader, .uniform-select') || element.parents().hasClass('input-group')) {
                    error.appendTo(element.parent().parent());
                }

                // Other elements
                else {
                    error.insertAfter(element);
                }
            },
            rules: {
                email: {
                    email: true
                }
            }
        });
    };

    // Uniform
    var _componentUniform = function () {
        if (!$().uniform) {
            console.warn('Warning - uniform.min.js is not loaded.');
            return;
        }

        // Initialize
        $('.form-input-styled').uniform({
            fileButtonClass: 'action btn bg-blue'
        });
    };

    // Select2 select
    var _componentSelect2 = function () {
        if (!$().select2) {
            console.warn('Warning - select2.min.js is not loaded.');
            return;
        }

        // Initialize
        var $select = $('.form-control-select2').select2({
            minimumResultsForSearch: Infinity,
            width: '100%'
        });

        // Trigger value change when selection is made
        $select.on('change', function () {
            $(this).trigger('blur');
        });
    };


    //
    // Return objects assigned to module
    //

    return {
        init: function () {
            _componentWizard();
            _componentUniform();
            _componentSelect2();
        }
    }
}();

// Initialize module
// ------------------------------

function hasUnicode(str) {
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) > 127) return true;
    }
    return false;
}


const options = {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
};


function numberWithCommas(x) {
    return Number(x).toLocaleString('en', options);
}

document.addEventListener('DOMContentLoaded', function () {
    FormWizard.init();
});
