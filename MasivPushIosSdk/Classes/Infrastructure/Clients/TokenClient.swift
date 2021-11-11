//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class TokenClient{
    
    let httpClient: HttpClient = HttpClient()

    public func sentToken(token: String, externalApplicationId: String, platform: MasivPlatform){
        let json: [String: Any] = ["token": token,
                                   "externalApplicationId": externalApplicationId,
                                   "platform": MasivPlatform.Ios.rawValue]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        httpClient.sentRequest(url: "https://pushprod.masivapp.com/api/management/tokens", json: jsonData)
    }
}
