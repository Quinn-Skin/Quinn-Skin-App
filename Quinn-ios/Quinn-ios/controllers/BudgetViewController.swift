//
//  BudgetViewController.swift
//  Quinn-ios
//
//  Created by Brayhan De Aza on 11/27/20.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet weak var twentyFiveButton: UIButton!
    @IBOutlet weak var twentyFiveToFiftyButton: UIButton!
    @IBOutlet weak var overFiftyButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    let cornerRadius = 20
    var answer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twentyFiveButton.layer.cornerRadius = CGFloat(cornerRadius)
        twentyFiveToFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        overFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        nextButton.layer.cornerRadius = CGFloat(cornerRadius)
        self.answer = "25 or Less"
        print(self.answer)
    }
    
    @IBAction func onTwintyFiveOrLess(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor = UIColor.red.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = UIColor.blue.cgColor
        overFiftyButton.layer.backgroundColor = UIColor.blue.cgColor
        self.answer = "25 or Less"
        print(self.answer)
    }
    
    @IBAction func onTwentyFiveToFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor = UIColor.blue.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = UIColor.red.cgColor
        overFiftyButton.layer.backgroundColor = UIColor.blue.cgColor
        self.answer = "$25-$50"
        print(self.answer)
        
        
    }
    
    @IBAction func overFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor = UIColor.blue.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = UIColor.blue.cgColor
        overFiftyButton.layer.backgroundColor = UIColor.red.cgColor
        self.answer = "Over $50"
        print(self.answer)
    }
}
