//
//  SkinTypeViewController.swift
//  Quinn-ios
//
//  Created by Yasiris Ortiz on 27.11.20.
//

import UIKit

class SkinTypeViewController: UIViewController {

    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var sensitiveButton: UIButton!
    @IBOutlet weak var dryButton: UIButton!
    @IBOutlet weak var oilyButton: UIButton!
    @IBOutlet weak var comboButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var userAnswer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        normalButton.layer.cornerRadius = 15
        sensitiveButton.layer.cornerRadius = 15
        dryButton.layer.cornerRadius = 15
        oilyButton.layer.cornerRadius = 15
        comboButton.layer.cornerRadius = 15
        nextButton.layer.cornerRadius = 15
    
       
    }
    
    
    @IBAction func onNormal(_ sender: Any) {
        self.normalButton.backgroundColor = UIColor.orange
        self.sensitiveButton.backgroundColor = UIColor.blue
        self.oilyButton.backgroundColor = UIColor.blue
        self.dryButton.backgroundColor = UIColor.blue
        self.comboButton.backgroundColor = UIColor.blue
        self.userAnswer = "normal"
        print(userAnswer)
        
        
    }
    
    @IBAction func onSensitive(_ sender: Any) {
        self.sensitiveButton.backgroundColor = UIColor.orange
        self.normalButton.backgroundColor = UIColor.blue
        self.oilyButton.backgroundColor = UIColor.blue
        self.dryButton.backgroundColor = UIColor.blue
        self.comboButton.backgroundColor = UIColor.blue
        self.userAnswer = "sentive"
        print(userAnswer)
        
    }
    
    @IBAction func onOily(_ sender: Any) {
        self.oilyButton.backgroundColor = UIColor.orange
        self.sensitiveButton.backgroundColor = UIColor.blue
        self.normalButton.backgroundColor = UIColor.blue
        self.dryButton.backgroundColor = UIColor.blue
        self.comboButton.backgroundColor = UIColor.blue
        self.userAnswer = "oily"
        print(userAnswer)
    }
    
     @IBAction func onDry(_ sender: Any) {
        self.dryButton.backgroundColor = UIColor.orange
        self.normalButton.backgroundColor = UIColor.blue
        self.sensitiveButton.backgroundColor = UIColor.blue
        self.oilyButton.backgroundColor = UIColor.blue
        self.comboButton.backgroundColor = UIColor.blue
        self.userAnswer = "dry"
        print(userAnswer)
     }
    
    @IBAction func onCombo(_ sender: Any) {
        self.comboButton.backgroundColor = UIColor.orange
        self.normalButton.backgroundColor = UIColor.blue
        self.sensitiveButton.backgroundColor = UIColor.blue
        self.oilyButton.backgroundColor = UIColor.blue
        self.dryButton.backgroundColor = UIColor.blue
        
        self.userAnswer = "combo"
        print(userAnswer)
    }
    
    @IBAction func onNext(_ sender: Any) {
        self.nextButton.backgroundColor = UIColor.darkGray
        

    }
    
    
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
