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
    //    @IBOutlet weak var circleView: UIView!
    var produts = [String : Any]()
    var urltoShare = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetailsButton.layer.cornerRadius = 10
        
//        let productId = AnswersManager.shared.productId.dropFirst(1).dropLast(2) as Substring
        let productId = "1"
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
//                print(self.produts)
                self.urltoShare = (self.produts["url"] as? String)!

                // Product Image
//                let imageUrl = self.produts["image_url"] as? String
                let formatedImageUrl = URL(string: "https://www.sephora.com/productimages/sku/s2002087-main-zoom.jpg?imwidth=600")
                self.productImage.af_setImage(withURL: formatedImageUrl!)

//                // Product name
                let productNameText = self.produts["brand_name"] as? String
                self.productBrandName.text = productNameText?.capitalized
              
//                // Product description
                self.productDescription.text = self.produts["description"] as? String
            }
         }
         task.resume()
    }
    
    @IBAction func sharedProduct(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [urltoShare], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
}
