//
//  demo.js
//  Strokes
//
//  Created by Anthony Sainez on 16 January 2020.
//  Copyright © 2020 Anthony Sainez. All rights reserved.
//

var resetTimeout;

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
    clearTimeout(resetTimeout);
    writer.setCharacter(newCharacter);
    resetWriter();
    window.writer = writer;
}

function resetWriter() {
    writer.quiz({
                onComplete: function(summaryData) {
                resetTimeout = setTimeout(function() {
                                          resetWriter();
                                          }, 1000);
                }
                });
}

$(function() {
  newWriter('水');
  resetWriter();
  window.writer = writer;
  });
