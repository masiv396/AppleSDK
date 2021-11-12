//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class MasivNotification {
    
    var imageUrl: String?
    var campaignId: String?
    var Id: String
    var cellphone: String?
    var creationDate: String
    var sentDate: String
    var campaignName: String?
    var notificationId: String
    var clickAction: String?
    var isTrial: Bool?
    
    init(didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        self.imageUrl = userInfo["imageUrl"] as? String
        self.campaignId = userInfo["campaignId"] as? String
        self.Id = UUID().uuidString
        self.cellphone = userInfo["cellphone"] as? String
        self.creationDate = userInfo["creationDate"] as! String
        self.sentDate = userInfo["sentDate"] as! String
        self.campaignName = userInfo["campaignName"] as? String
        self.notificationId = userInfo["notificationId"] as! String
        self.clickAction = userInfo["clickAction"] as? String
        self.isTrial = (userInfo["isTrial"] as? String) == nil ? nil : (userInfo["isTrial"] as? String)!.lowercased().elementsEqual("true")
    }
}
