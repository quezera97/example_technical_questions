$(document).ready(function () {
    var filteredInput = '';
    var totalValue = '';

    $('#lets_go-question_4').click(function(){
        $("#show-question_4").modal('show');
    });
    
    $('#reset').click(function(){
        $('#input_calculator').val('');
        $('#output_calculator').val('');
    });

    $('#delete').click(function(){
        filteredInput = filteredInput.substring(0, filteredInput.length - 1);
        $('#input_calculator').val(filteredInput);
        $('#output_calculator').val(filteredInput);
    });

    $('#input_calculator').keyup(function () {
        var input = $(this).val();
        filteredInput = input.replace(/[^\d*/+-]/g, '');
        $('#input_calculator').val(filteredInput);
        $('#output_calculator').val(filteredInput);
    });

    function handleOperatorClick(value) {
        var operators = ['+', '-', '*', '/'];
        var lastChar = filteredInput.substr(filteredInput.length - 1);

        if (!operators.includes(lastChar)) {
            filteredInput += value;
        }

        $('#input_calculator').val(filteredInput);
        $('#output_calculator').val(filteredInput);
    }


    $('#plus').click(function () {
        handleOperatorClick('+');                               
    });

    $('#minus').click(function () {
        handleOperatorClick('-');
    });

    $('#times').click(function () {
        handleOperatorClick('*');
    });

    $('#divide').click(function () {
        handleOperatorClick('/');
    });

    $('.calculator_operator').click(function () {
        $('#input_calculator').focus();
    })


    $('#calculate').click(function () {
        totalValue = eval(filteredInput);
        $('#output_calculator').val(totalValue);
    })
});