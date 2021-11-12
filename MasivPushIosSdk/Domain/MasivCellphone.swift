//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class MasivCellphone{
    
    var token: String
    var cellphone: String
    var externalAppId: String
    
    init(token: String, cellphone: String, externalAppId: String){
        self.token = token
        self.cellphone = cellphone
        self.externalAppId = externalAppId
    }
}
