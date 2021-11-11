//
//  HttpClient.swift
//  MasivPushIosSdk
//
//  Created by Masiv on 5/10/21.
//

class HttpClient{

    public func sentRequest(url: String, json: Data?){
        let request = getRequest(url: url, json: json)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                if (error.code == -1005){
                    self.sentRequest(url: url, json: json)
                }else{
                    NSLog("Error took place:\n"+(error as! String), "")
                }
            }else if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    NSLog("Response data Http request:\n"+dataString , "")
            }
        }
        task.resume()
    }
        
    private func getRequest(url: String, json: Data?) -> URLRequest{
        let url = URL(string: url)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = json
        return request
    }
}
