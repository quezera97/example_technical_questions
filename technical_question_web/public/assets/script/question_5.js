$(document).ready(function () {
    var registerForm = {};

    $("#register-button").click(function (e) {
        localStorage.clear();

        var first_name = $('#firstName').val();
        var last_name = $('#lastName').val();
        var gender = $('input[name=genderOptions]:checked').val();
        var email = $('#emailAddress').val();
        var phone = $('#phoneNumber').val();
        var subscription = $('#subscription-plan').val();

        if(first_name == ''){
            alert('First name is required');
        }
        else if (email == '') {
            alert('Email is required');
        }
        else if( !validateEmail(email)){
            alert("Invalid Email Address");
        }
        else{
            $('#modal-first_name').text(first_name);
            $('#modal-last_name').text(last_name);
            $('#modal-gender').text(gender);
            $('#modal-email').text(email);
            $('#modal-phone').text(phone);
            $('#modal-subscription').text(subscription);
    
            registerForm = {
                first_name: first_name,
                last_name: last_name,
                gender: gender,
                email: email,
                phone: phone,
                subscription: subscription,
            };
    
            $("#show-details").modal('show');
        }

    });

    function validateEmail(email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test( email );
    }


    $('#no-register').click(function (e){
        $('#guest_name').text('Are you not ' + $('#firstName').val() + ' ' + $('#lastName').val() + '?');
    })

    $('#confirm-register').click(function (e) {
        for (var key in registerForm) {
            if (registerForm.hasOwnProperty(key)) {
                var value = registerForm[key];
                
                localStorage.setItem(key, value);
            }
        }

        $("#show-details").modal('hide');

        window.location.href = "dashboard.html";
    })
});