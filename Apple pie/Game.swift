//
//  Game.swift
//  Apple pie
//
//  Created by Viktor on 06/11/2020.
//

import Foundation

struct Game {
    var word:String
    var incorrectMovesRemaining:Int
    var guassedLetters: [Character]
    
    var formattedWord: String {
        var guassedWord = ""
        for letter in word {
            if guassedLetters.contains(letter) {
                guassedWord += "\(letter)"
            }
            else {
                guassedWord += "_"
            }
        }
        
        return guassedWord
    }
    
    mutating func playerGussed(letter:Character) {
        guassedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
