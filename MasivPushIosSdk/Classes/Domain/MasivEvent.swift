//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

public class MasivEvent {

    var cellphone: String?
    var precedence: Int
    var creationDate: String
    var sentDate: String
    var platform: MasivPlatform
    var token: String
    var eventType: MasivEventType
    var applicationId: String
    var campaignId: String?
    var eventTimestamp: String
    var location: String
    var imageUrl: String?
    var campaignName: String?
    var notificationId: String
    var isTrial: Bool?

    init(cellphone: String?, creationDate: String, sentDate: String, platform: MasivPlatform,token: String,
         eventType: MasivEventType, applicationId: String, campaignId: String?,
         eventTimestamp: String, location: String, imageUrl: String?, campaignName: String?, notificationId: String,
         isTrial: Bool?) {
        self.cellphone = cellphone
        self.precedence = eventType ==  MasivEventType.Opened ? 50 : 30;
        self.creationDate = creationDate
        self.sentDate = sentDate
        self.platform = platform
        self.token = token
        self.eventType = eventType
        self.applicationId = applicationId
        self.campaignId = campaignId
        self.eventTimestamp = eventTimestamp
        self.location = location
        self.imageUrl = imageUrl
        self.campaignName = campaignName
        self.notificationId = notificationId
        self.isTrial = isTrial
    }
}
