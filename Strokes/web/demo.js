//
//  demo.js
//  Strokes
//
//  Created by Anthony Sainez on 16 January 2020.
//  Copyright © 2020 Anthony Sainez. All rights reserved.
//

function newWriter(character) {
    writer = HanziWriter.create('quiz-target', character, {
                                width: 300,
                                height: 300,
                                showOutline: true,
                                showCharacter: true,
                                showHintAfterMisses: 1
                                });
}

function changeCharacter(newCharacter) {
    writer.setCharacter(newCharacter);
    writer.quiz();
    window.writer = writer;
}

function resetWriter() {
    writer.quiz({
                onComplete: function(summaryData) {
                resetWriter();
                }
                });
}

document.addEventListener('DOMContentLoaded', function() {
    newWriter('水');
    writer.quiz({
                onComplete: function(summaryData) {
                    resetWriter();
                }
    });
    window.writer = writer;
});
