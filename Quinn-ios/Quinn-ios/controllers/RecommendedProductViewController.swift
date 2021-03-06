//
//  RecommendedProductViewController.swift
//  test
//  Created by Brayhan De Aza on 11/21/20.

import UIKit
import AlamofireImage

class RecommendedProductViewController: UIViewController {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBrandName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var viewDetailsButton: UIButton!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    
    var produts = [String : Any]()
    var urltoShare = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetailsButton.layer.cornerRadius = 10
       
        
//        let productId = AnswersManager.shared.productId.dropFirst(1).dropLast(2) as Substring
        let productId = "0"
        guard let url = URL(string: "https://quinn-server.herokuapp.com/products/\(productId)") else { return }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
               print(error.localizedDescription)

            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.produts = dataDictionary["Produt"] as! [String : Any]
                self.urltoShare = (self.produts["url"] as? String)!

                // Product Image
                let imageUrl = Substring((self.produts["image_url"] as? Substring)!)
                let formatedImageUrl = URL(string: String(imageUrl))
                self.productImage.af_setImage(withURL: formatedImageUrl!)

//                // Product name
                let productNameText = self.produts["brand_name"] as? String
                self.productBrandName.text = productNameText?.capitalized
              
//                // Product description
                self.productDescription.text = self.produts["description"] as? String
                
//                coreImage
                let score = self.produts["score"]
                let scorString = "\(String(describing: score))"
                let scorStringCleaned = scorString.dropFirst(9).dropLast(1)
//                let doubleScore = Double(scorStringCleaned)
//                print(doubleScore!)
                self.starsLabel.text = scorStringCleaned as? String
                self.setScoreImage(score: Double(2.0))
            }
         }
        
         task.resume()
    }
    
    func setScoreImage(score: Double) -> UIImageView {
        if score > Double(0.0) && score < Double(1.5) {
            scoreImage.image = UIImage(named: "one-star")
            
        } else if (score > Double(1.4) && score < Double(2.5)) {
            scoreImage.image = UIImage(named: "two-stars")
            
        } else if (score > Double(2.4) && score < Double(3.5)) {
            scoreImage.image = UIImage(named: "three-stars")
            
        } else if (score > Double(3.4) && score < Double(4.0)) {
            scoreImage.image = UIImage(named: "four-stars")
            
        } else {
            scoreImage.image = UIImage(named: "five-stars")
        }
        return scoreImage
    }
    
        
    @IBAction func sharedProduct(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [urltoShare], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
}
