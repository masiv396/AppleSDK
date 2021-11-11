//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class MasivToken{
    
    var token: String
    var externalApplicationId: String
    var platform: MasivPlatform
    
    init(token: String, externalApplicationId: String, platform: MasivPlatform){
        self.token = token
        self.externalApplicationId = externalApplicationId
        self.platform = platform
    }
}
