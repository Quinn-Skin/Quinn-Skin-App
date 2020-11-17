import UIKit

//let parameters = ["Label":2,"price":10,"score":5,"Combination":1,"Dry":0,"Normal":1,"Oily":0,"Sensitive":1]

let parameters = [2,10,5,1,0,1,0,1]
let url = URL(string: "https://quinn-model.herokuapp.com/predict")

let session = URLSession.shared

var request = URLRequest(url: url!)
request.httpMethod = "POST"

do {
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
} catch let error{
    print(error.localizedDescription)
}

request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")

let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
    guard error == nil else{
        return
    }
    
    guard let data = data else{
        return
    }
    
    do{
        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as?[String: Any]{
            print(json)
        }
    } catch let error{
        print(error.localizedDescription)
    }
})
task.resume()


