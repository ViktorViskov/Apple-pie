//
//  ViewController.swift
//  Apple pie
//
//  Created by Viktor on 05/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious",
        "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame:Game!
    
    @IBAction func letterButtonPressed(_ sender: UIButton){
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGussed(letter: letter)
        updateGameState()
    }
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guassedLetters: [])
            enableLetterButton(true)
            updateUI()
        }
        else {
            enableLetterButton(false)
        }
    }
    
    func enableLetterButton (_ enable:Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            print(totalLosses)
        }
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            print(totalWins)
        }
        else {
            updateUI()
        }
    }


}

