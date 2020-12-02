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
        
//        AnswersManager.shared.productId = "10"
        AnswersManager.shared.answers["sensitive"] = 1
        self.modelCaller()
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
        AnswersManager.shared.answers["dry"] = 1
        print(userAnswer)
     }
    
    @IBAction func onCombo(_ sender: Any) {
        self.comboButton.backgroundColor = UIColor.orange
        self.normalButton.backgroundColor = UIColor.blue
        self.sensitiveButton.backgroundColor = UIColor.blue
        self.oilyButton.backgroundColor = UIColor.blue
        self.dryButton.backgroundColor = UIColor.blue
        AnswersManager.shared.answers["combination"] = 1
        
        self.userAnswer = "combo"
        print(userAnswer)
    }
    
    @IBAction func onNext(_ sender: Any) {
        self.nextButton.backgroundColor = UIColor.darkGray
        

    }
    
    
    func modelCaller() -> Void {
       
        //let parameters = ["Label":2,"price":10,"score":5,"Combination":1,"Dry":0,"Normal":1,"Oily":0,"Sensitive":1]
        let parameters:[[Int]] = [[2,10,4,1,0,0,0,0]]

        let url = URL(string: "https://quinn-model.herokuapp.com/productid")
        let session = URLSession.shared

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters,options: JSONSerialization.WritingOptions.prettyPrinted)
            
        } catch let error{
            print(error.localizedDescription)
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")


        let task = session.uploadTask(with: request as URLRequest,from: request.httpBody) {data, response,error in
            guard error == nil else{
                return
            }
            
        //    print(response)
            
            if let data = data, let dataString = String(data:data,encoding: .utf8) {
                print(dataString)
                AnswersManager.shared.productId = dataString
            }
        }
        task.resume()
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
