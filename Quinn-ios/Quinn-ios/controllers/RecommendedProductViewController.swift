//
//  RecommendedProductViewController.swift
//  test
//
//  Created by Brayhan De Aza on 11/21/20.
//

import UIKit
import AlamofireImage

class RecommendedProductViewController: UIViewController {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    var produts = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AnswersManager.shared.productId)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.recommmendedProduct(id: AnswersManager.shared.productId)
    }
    func recommmendedProduct(id: String) -> Void {
        let url = URL(string: "https://quinn-server.herokuapp.com/products/\(id)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)

        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
               print(error.localizedDescription)
                
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.produts = dataDictionary["Produt"] as! [String : Any]
        
                
                // Product Image
                let imageUrl = self.produts["image_url"] as? String
                let formatedImageUrl = URL(string: imageUrl!)
                self.productImage.af_setImage(withURL: formatedImageUrl!)

                // Product name
                let productNameText = self.produts["brand_name"] as? String
                self.productName.text = productNameText?.capitalized
                
                // Product description
                self.productDescription.text = self.produts["description"] as? String
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
