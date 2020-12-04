//
//  RecommendationViewController.swift
//  SurveyCollectionView
//
//  Created by Amy W. on 11/26/20.
//

import UIKit
import AlamofireImage



class RecommendationViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBrandName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    //product details link
    
    @IBOutlet weak var productDetails: UIButton!
    @IBAction func productDetailsLink(_ sender: Any) {
        let productURL = self.products["url"] as? String
        UIApplication.shared.open(URL(string: productURL!)!)
        
    }
   

    var products = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetails.layer.cornerRadius = 20

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       self.recommendation(id: "5")
//        self.productDescription.layer.borderWidth = 1
//        self.productDescription.layer.borderColor = UIColor.white.cgColor

        
//       https://quinn-model.herokuapp.com/productid
    }
    
    
    func recommendation(id: String) -> Void {
        let url = URL(string: "https://quinn-server.herokuapp.com/products/\(id)")!
//        let url = URL(string: "https://quinn-server.herokuapp.com/products/modelURL")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData,timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request){ (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.products = dataDictionary["Produt"] as! [String:Any]
                
                //product image
                let imagePath = self.products["image_url"] as? String
                let imageURL = URL(string: imagePath!)
                self.productImage.af.setImage(withURL: imageURL!)
                
                //product brand name
                self.productBrandName.text = self.products["brand_name"] as? String
                
                //product name
                self.productName.text = self.products["product_name"] as? String
                
                // product description
                self.productDescription.text = self.products["description"] as? String
                
                //product rating
//                self.productRating.text = "\(String(describing: self.products["score"] as? Double))"
              
                self.productRating.text = "\(String(describing: self.products["score"] as! Double))"
              
               
                //product price
                self.productPrice.text = "\(String(describing: self.products["price"] as! Int))"
//                self.productPrice.text = "\(String(describing: self.products["price"] as? Int))"
               
               
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
