//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class EventClient{
    
    let httpClient: HttpClient = HttpClient()
    
    public func sentEvent(masivEvent: MasivEvent){
        let json: [String?: Any] = ["cellphone": masivEvent.cellphone == nil ? NSNull() : masivEvent.cellphone!,
                                   "platform": masivEvent.platform.rawValue,
                                   "token": masivEvent.token,
                                   "eventType": masivEvent.eventType.rawValue,
                                   "applicationId": masivEvent.applicationId,
                                   "eventTimestamp": masivEvent.eventTimestamp,
                                   "location": masivEvent.location,
                                   "imageUrl": masivEvent.imageUrl == nil ? NSNull() : masivEvent.imageUrl!,
                                   "precedence": masivEvent.precedence,
                                   "creationDate": masivEvent.creationDate,
                                   "sentDate": masivEvent.sentDate,
                                   "campaignId": masivEvent.campaignId == nil ? NSNull() : masivEvent.campaignId!,
                                   "campaignName": masivEvent.campaignName == nil ? NSNull() : masivEvent.campaignName!,
                                   "notificationId": masivEvent.notificationId,
                                   "isTrial": masivEvent.isTrial == nil ? NSNull() : masivEvent.isTrial!]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        httpClient.sentRequest(url: "https://pushprod.masivapp.com/webhook/events", json: jsonData)
    }
}
