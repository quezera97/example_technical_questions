$(document).ready(function () {
    var listOfNumbers = [];

    $('#lets_go-question_1').click(function(){
        $("#show-question_1").modal('show');
    });

    $('.input_number').on('input', function(e) {
        listOfNumbers = [];
        var arrNumbers = [];

        for (var i = 1; i <= 8; i++) {
            var value = $('#array_number_' + i).val();
            if (value != '') {
                arrNumbers.push(value);
            }
        }
        
        if (arrNumbers.length > 0) {
            for (const number of arrNumbers) {
                if (/\d*9\d*/.test(number)) {
                    break;
                }
                else if(number % 2 || number == 0) {
                    listOfNumbers.push(' Odd');
                }
                else{
                    listOfNumbers.push(' ' + number);
                }
            }
        }

        $("#answer-question_1").text(listOfNumbers);
    });
});