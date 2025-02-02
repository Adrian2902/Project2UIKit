//
//  ViewController.swift
//  project2
//
//  Created by Adrian Gutierrez Carbajal  on 27/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
            
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
            
        correctAnswer = Int.random(in: 0...2)
        title = "Score: \(score) \t \(countries[correctAnswer].uppercased())"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
            
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[correctAnswer])"
            score -= 1
        }
        count += 1
        
        if count == 10 {
            let gameOver = UIAlertController(title: "Game Over", message: "Your final score is \(score).", preferredStyle: .alert)
            present(gameOver, animated: true)
        }else{
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
}

