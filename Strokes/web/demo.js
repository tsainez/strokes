var quizWriter;
var character = '水';

function changeCharacter(newCharacter) {
    quizWriter.setCharacter(newCharacter);
    quizWriter.quiz();
    window.quizWriter = quizWriter;
}

function updateCharacter() {
    quizWriter = HanziWriter.create('quiz-target', character, {
                                    width: 300,
                                    height: 300,
                                    showOutline: true,
                                    showCharacter: true,
                                    showHintAfterMisses: 1
                                    });
    quizWriter.quiz();
    
    // for easier debugging
    window.quizWriter = quizWriter;
}

$(function() {
  updateCharacter();
  });
