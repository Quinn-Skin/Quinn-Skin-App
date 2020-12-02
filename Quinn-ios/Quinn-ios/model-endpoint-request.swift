import UIKit

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
    }
    

}
task.resume()
