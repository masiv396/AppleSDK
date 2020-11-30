import Foundation

struct MasivianPush {
    var text = "Hello, World!"
}

public func sentState(messageId: String,state: String, auth: String){
    let json: [String: Any] = ["id": messageId,
                               "state": state]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "http://LB-LabsMasivianPush-Sender-983241749.us-east-1.elb.amazonaws.com/v1/notificationState/update")!
    var request = URLRequest(url: url)
    request.setValue(auth, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "POST"

    // insert json data to the request
    request.httpBody = jsonData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            print(responseJSON)
        }
    }

    task.resume()
    
}
