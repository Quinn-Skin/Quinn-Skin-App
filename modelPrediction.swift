import UIKit

class AnswersManager {
    static var shared = AnswersManager()
    var productId : String = ""
    var answers = [
        "label": 4,
        "price" : 40,
        "score" : 4,
        "dry" : 0,
        "combination": 0,
        "normal" : 0,
        "oily" : 0,
        "sensitive" : 0
    ] as [String : Any?]
    
}

let answersFromAnswerManager = [
    AnswersManager.shared.answers["label"],
    AnswersManager.shared.answers["price"],
    AnswersManager.shared.answers["score"],
    AnswersManager.shared.answers["dry"],
    AnswersManager.shared.answers["combination"],
    AnswersManager.shared.answers["normal"],
    AnswersManager.shared.answers["oily"],
    AnswersManager.shared.answers["sensitive"]
] as! [Int]

    
let parameters :[[Int]] = [answersFromAnswerManager]
print("\(parameters)")

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


    if let data = data, let dataString = String(data:data,encoding: .utf8) {
        print(dataString)
        AnswersManager.shared.productId = dataString
    }
}
task.resume()
