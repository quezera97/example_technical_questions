$(document).ready(function () {
    var selectShape = '';
    var height = 0;
    var length = 0;

    function resetDimension() {
        height = 0;
        length = 0;

        $('#height').val(0)
        $('#length').val(0)
    }

    $('#div-length, #div-height').hide();
    $('#div-shape').hide();

    $('#lets_go-question_3').click(function(){
        $("#show-question_3").modal('show');
    });

    $('#select_shape').change(function () {
        selectShape = $('#select_shape').val();                                

        switch (selectShape){
            case 'square':
                resetDimension();
                $('#div-length').show();
                $('#div-height').show();
                break;
            case 'triangle':
                resetDimension();
                $('#div-length').hide();
                $('#div-height').show();
                break;
            case 'diamond':
                resetDimension();
                $('#div-length').hide();
                $('#div-height').show();
                break;
            default:
                resetDimension();
                $('#div-length, #div-height').hide();
                break;
        }

        updateShape();
    });

    $('#height, #length').on('input' , function () {
        height = parseInt($('#height').val());
        length = parseInt($('#length').val());
        updateShape();
    });

    function updateShape() {                                
        $('#div-shape').show();
        var shapeString = '';

        if (selectShape == 'square') {
            for (var i = 0; i < height; i++) {
                var row = '';
                for (var j = 0; j < length; j++) {
                    row += '*';
                }
                shapeString += row + '\n';
            }
            $('#shape').val(shapeString);
        } 
        else if (selectShape == 'triangle') {
            for (var i = 0; i < height; i++) {
                var row = '';

                for (var j = 0; j < height - i - 1; j++) {
                    row += ' ';
                }
                row += '';

                for (var j = 0; j <= i; j++) {
                    row += '*';
                }
                for (var j = 0; j < i; j++) {
                    row += '*';
                }
                shapeString += row + '\n';
            }
            $('#shape').val(shapeString);
        }
        else if (selectShape == 'diamond') {
            for (var i = 0; i < height; i++) {
                var row = '';
                for (var j = 0; j < height - i; j++) {
                    row += ' ';
                }
                for (var j = 0; j <= i; j++) {
                    row += '*';
                }
                for (var j = 0; j < i; j++) {
                    row += '*';
                }
                shapeString += row + '\n';
            }                                    


            for (var i = height; i > 0; i--) {
                var row = '';
                for (var j = 0; j < height - i; j++) {
                    row += ' ';
                }
                for (var j = 0; j <= i; j++) {
                    row += '*';
                }
                for (var j = 0; j < i; j++) {
                    row += '*';
                }
                shapeString += row + '\n';
            }
            $('#shape').val(shapeString);
        }
        else {
            $('#div-shape').hide();
        }
    }
});