//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class TokenService: NSObject{
    
    var tokenClient: TokenClient = TokenClient()
    let masivPlatform = MasivPlatform.self
    var token = ""
    
    func registerToken(masivToken: MasivToken){
        tokenClient.sentToken(token: masivToken.token, externalApplicationId: masivToken.externalApplicationId, platform: masivToken.platform)
    }
}
