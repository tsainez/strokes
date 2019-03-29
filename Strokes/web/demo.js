//var animationWriter;
var quizWriter;
var character = '水';
var isCharVisible;
var isOutlineVisible;

function changeCharacter(newCharacter) {
    /*
    quizWriter = HanziWriter.create('quiz-target', newCharacter, {
                                    width: 300,
                                    height: 300,
                                    showOutline: true,
                                    showCharacter: false,
                                    showHintAfterMisses: 1
                                    });
     */
    
    quizWriter.setCharacter(newCharacter);
    quizWriter.quiz();
    window.quizWriter = quizWriter;
}

function updateCharacter() {
    //$('#animation-target').html('');
    //$('#quiz-target').html('');
    
    /*
    animationWriter = HanziWriter.create('animation-target', character, {
                                         width: 300,
                                         height: 300,
                                         showOutline: shouldShowOutline('animation'),
                                         showCharacter: false
                                         });
    */
    
    quizWriter = HanziWriter.create('quiz-target', character, {
                                    width: 300,
                                    height: 300,
                                    showOutline: true,
                                    //showOutline: shouldShowOutline('quiz'),
                                    showCharacter: true,
                                    showHintAfterMisses: 1
                                    });
    quizWriter.quiz();
    
    // for easier debugging
    window.quizWriter = quizWriter;
}

function shouldShowOutline(demoType) {
    return $('#' + demoType + '-show-outline').prop('checked');
}

$(function() {
  updateCharacter();
  
  $('.js-char-form').on('submit', function(evt) {
                        evt.preventDefault();
                        updateCharacter();
                        });
  

  /*
  $('#quiz-show-outline').on('click', function() {
                             var method = shouldShowOutline('quiz') ? 'showOutline' : 'hideOutline';
                             quizWriter[method]();
                             });
   */
  });
