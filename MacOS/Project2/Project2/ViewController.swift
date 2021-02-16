//
//  ViewController.swift
//  Project2
//
//  Created by Alex Valente on 15/02/2021.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var guess: NSTextField!
    
    var playerGuess: String = ""
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return history.count
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        let guessString = guess.stringValue
        guard Set(guessString).count == 4 else {return}
        guard guessString.count == 4 else {return}
        
        let badChars = CharacterSet(charactersIn: "0123456789").inverted
        guard guessString.rangeOfCharacter(from: badChars) == nil else {return}
        
        history.insert(guessString, at: 0)
        tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideDown)
        
        let resultString = result(for: guessString)
        
        if resultString.contains("4B") {
            let alert = NSAlert()
            alert.messageText = "You Win!"
            alert.informativeText = "Congratulations! Click OK to play again!"
            alert.runModal()
            
            startNewGame()
        }
    }
    
    func result (for guess: String) -> String {
        var bulls = 0
        var cows = 0
        
        let guessLetters = Array(guess)
        let answerLetters = Array(playerGuess)
        
        for(index, letter) in guessLetters.enumerated() {
            if letter == answerLetters[index] {
                bulls += 1
            }
            else if answerLetters.contains(letter){
                cows += 1
            }
        }
        
        return "\(bulls)B \(cows)C"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        
        if tableColumn?.title == "Guess" {
            vw.textField?.stringValue = history[row]
        }
        else{
            vw.textField?.stringValue = result(for: history[row])
        }
        
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
    func startNewGame() {
        guess.stringValue = ""
        history.removeAll()
        playerGuess = ""
        
        var numbers = Array(0...9)
        numbers.shuffle()
        
        //Debug Only (show result)
        //print(Array(numbers[6 ... 9].reversed()))
        
        for _ in 0 ..< 4 {
            playerGuess.append(String(numbers.removeLast()))
        }
        
        tableView.reloadData()
    }
}

