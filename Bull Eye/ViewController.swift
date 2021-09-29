//
//  ViewController.swift
//  Bull Eye
//
//  Created by Habibur Rahman on 9/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    var userAnswer: Int = 0
    var  randomNumber: Int = 0
    
    var score: Int = 0
    var level: Int = 0
    
    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var sliderValueLabel: UILabel!
    
    
    @IBOutlet var Levellabel: UILabel!
    
    
    @IBOutlet var scorelabel: UILabel!
    @IBOutlet var uiSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func hitMeButton(_ sender: UIButton) {
        
        var alertTitle = ""
        var alertMessage = ""
        var startOverTitle = ""
        
        if randomNumber == 0 {
            
            alertTitle = "Attention!"
            alertMessage = "You must start over first."
            startOverTitle = "Start Over"
            
        } else if randomNumber != userAnswer{
           
            alertTitle = "Sorry!"
            alertMessage = "You lose."
            startOverTitle = "Play Again"
            
        } else if randomNumber == userAnswer {
            
            alertTitle = "Congratulation!"
             alertMessage = "You have won."
             startOverTitle = "Play Again"
            
        }
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: startOverTitle, style: .default, handler: {_ in self.createRandomNumber()
            
            
            if alertTitle == "Congratulation!" {
                self.score += 1
                
            } else if alertTitle == "Sorry!"{
                self.score -= 1
            }
            
            self.level += 1
            
            self.scorelabel.text = String(self.score)
            self.Levellabel.text = String(self.level)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.randomNumber = 0
            self.numberLabel.text = String("")
            self.uiSlider.value = 0
            self.sliderValueLabel.text = String("")
            self.level = 0
            self.scorelabel.text = String("0")
            self.Levellabel.text = String("0")
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func sliderButton(_ sender: UISlider) {
        
        userAnswer = lroundf(sender.value)
        sliderValueLabel.text = String(userAnswer)
    }
    
    func createRandomNumber() {
        randomNumber = Int.random(in: 1...30)
        numberLabel.text = String(randomNumber)
        uiSlider.value = 0
        sliderValueLabel.text = String("")
        
        
    }
    
    
    @IBAction func startOverButton(_ sender: UIButton) {
        createRandomNumber()
        score = 0
        level = 1
        scorelabel.text = String(score)
        Levellabel.text = String(level)
    }
    
    
    @IBAction func exitButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Do you want to Quit?", message: "This will terminate your operation.", preferredStyle: .alert)
        alertController.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
        alertController.addAction(UIAlertAction(title: "Quit", style: .destructive, handler: { _ in
            exit(-1)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
}
