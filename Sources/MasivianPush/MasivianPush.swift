import Foundation

struct MasivianPush {
    var text = "Hello, World!"
}

public func sentState(messageId: String,state: String, auth: String){
    let json: [String: Any] = ["id": messageId,
                               "state": state]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    sentRequest(url: "https://push-prodtemp.masivapp.com/v1/notificationState/update", auth: auth, json: jsonData)
}

public func sentToken(platformName: String,token: String,appId: String, auth: String){
    let json: [String: Any] = ["platformName": platformName,
                               "token": token,
                               "appId":appId]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    sentRequest(url: "https://push-prodtemp.masivapp.com/v1/association/registerToken", auth: auth, json: jsonData)
}

public func sentDisableToken(token: String, auth: String){
    let json: [String: Any] = ["token": token]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
    // create post request
    sentRequest(url: "https://push-prodtemp.masivapp.com/v1/notification/instanceRegistryCancel", auth: auth, json: jsonData)
}

public func sentLocation(messageId: String,country: String,countryCode: String,city: String, auth: String){
    let json: [String: Any] = ["id": messageId,
                               "country": country,
                               "countryCode":countryCode,
                               "city":city]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    sentRequest(url: "https://push-prodtemp.masivapp.com/v1/notificationState/updateLocation", auth: auth, json: jsonData)
}

public func sentRequest(url: String, auth: String, json: Data?){
    let url = URL(string: url)!
    let authorization = "Basic \(auth)"
    var request = URLRequest(url: url)
    request.setValue(authorization, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "POST"

    // insert json data to the request
    request.httpBody = json

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
