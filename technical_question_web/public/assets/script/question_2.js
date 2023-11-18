$(document).ready(function () {
    $('#lets_go-question_2').click(function(){
        $("#show-question_2").modal('show');
    });

    $('#text-question_2').keyup(function(event){
        var countEachVowel = 0;
        var countEachNumber = 0;
        var countEachConsonant = 0;
        var countEachSpecialChar = 0;
        var oneCharVowel = {};
        var oneCharConsonant = {};
        var oneCharSpecialChar = {};
        var oneCharNumber = {};
        var longestWordinList = '';
        var wordConstructed = '';
        var listOfLongestWord = [];
        var value = $('#text-question_2').val();

        for (var i = 0; i < value.length; i++) {
            var char = value[i];
            
            if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
                countEachVowel++;
                oneCharVowel[char] = (oneCharVowel[char] ?? 0) + 1;
                
                wordConstructed += char;
               
            }
            else if (/[!@#$%^&*(),.?":{}|<>_-\s]/.test(char)) {
                countEachSpecialChar++;
                if (/\s/.test(char) || char === ' ') {
                    char = '[ Blank Space ]';
                }

                oneCharSpecialChar[char] = (oneCharSpecialChar[char] ?? 0) + 1;

                listOfLongestWord.push(wordConstructed);
                wordConstructed = '';
            }
            else if (/\d/.test(char)) {
                countEachNumber++;
                oneCharNumber[char] = (oneCharNumber[char] ?? 0) + 1;

                listOfLongestWord.push(wordConstructed);
                wordConstructed = '';
            }
            else {
                countEachConsonant++;
                oneCharConsonant[char] = (oneCharConsonant[char] ?? 0) + 1;

                wordConstructed += char;
            }
        }


        if (wordConstructed != '') {
            listOfLongestWord.push(wordConstructed);
        }

        listOfLongestWord.forEach(word => {
            if (word.length > longestWordinList.length) {
                longestWordinList = word;
            }
        });

        $('#vowels').val(JSON.stringify(oneCharVowel));
        $('#consonants').val(JSON.stringify(oneCharConsonant));
        $('#numbers').val(JSON.stringify(oneCharNumber));
        $('#otherChars').val(JSON.stringify(oneCharSpecialChar));
        $('#longestWord').val(longestWordinList);
    });
});