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
    
    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var sliderValueLabel: UILabel!
    
    
    @IBOutlet var uiSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func hitMeButton(_ sender: UIButton) {
        
        var title = ""
        var message = ""
        var startOver = ""
        if randomNumber == 0 {
            title = "Attention!"
            message = "You must start over first."
            startOver = "Start Over"
        } else if randomNumber != userAnswer{
            title = "Sorry!"
            message = "You lose."
            startOver = "Play Again"
        } else if randomNumber == userAnswer {
            
            title = "Congratulation!"
             message = "You have won."
             startOver = "Play Again"
            
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: startOver, style: .default, handler: {_ in self.createRandomNumber()}))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.randomNumber = 0
            self.numberLabel.text = String("")
            self.uiSlider.value = 0
            self.sliderValueLabel.text = String("")
        }))
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func sliderButton(_ sender: UISlider) {
        //userAnswer = Int(sender.value)
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
