import Foundation

struct MasivianPush {
    var text = "Hello, World!"
}

public func sentState(messageId: String,state: String, auth: String){
    let json: [String: Any] = ["id": messageId,
                               "state": state]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "https://push-prodtemp.masivapp.com/v1/notificationState/update")!
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

public func sentToken(platformName: String,token: String,appId: String, auth: String){
    let json: [String: Any] = ["platformName": platformName,
                               "token": token,
                               "appId":appId]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "https://push-prodtemp.masivapp.com/v1/association/registerToken")!
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

public func sentLocation(messageId: String,country: String,countryCode: String,city: String, auth: String){
    let json: [String: Any] = ["id": messageId,
                               "country": country,
                               "countryCode":countryCode,
                               "city":city]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "https://push-prodtemp.masivapp.com/v1/notificationState/updateLocation")!
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
