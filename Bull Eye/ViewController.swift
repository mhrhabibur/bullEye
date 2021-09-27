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
        
        createRandomNumber()
    }
    
    
    @IBAction func hitMeButton(_ sender: UIButton) {
        
        var message = ""
        if randomNumber == userAnswer {
           message = "You won"
        } else {
            message = "You lose"
        }
        
        let alertController = UIAlertController(title: message, message: .none, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.createRandomNumber()}))
        
        alertController.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { _ in
            self.numberLabel.text = String("")
            self.uiSlider.value = 0
            self.sliderValueLabel.text = String("Play?")
        }))
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func sliderButton(_ sender: UISlider) {
        userAnswer = Int(sender.value)
        sliderValueLabel.text = String(userAnswer)
    }
    
    func createRandomNumber() {
        randomNumber = Int.random(in: 1...30)
        numberLabel.text = String(randomNumber)
        uiSlider.value = 0
        sliderValueLabel.text = String("")
        
    }
}
