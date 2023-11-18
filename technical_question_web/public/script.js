
$(document).ready(function () {
    var isIntruders = false;

    const popperScript = $('<script>', {
        src: 'https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js',
        integrity: 'sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p',
        crossorigin: 'anonymous'
    });
    
    const bootstrapScript = $('<script>', {
        src: 'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js',
        integrity: 'sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF',
        crossorigin: 'anonymous'
    });
    
    $('head').append(popperScript, bootstrapScript);

    var localFirstName = localStorage.getItem('first_name');
    var localLastName = localStorage.getItem('last_name');

    if(localFirstName == null){
        $('#guest_name').text('Call 999, We Have Intruders');

        isIntruders = true;

        $('.checkIntruders').hide();
        $('.logInIntruders').show();
    }
    else{
        $('#guest_name').text('Hello, ' + localFirstName + ' ' + localLastName);
        $('.checkIntruders').show();
        $('.logInIntruders').hide();
    }
});