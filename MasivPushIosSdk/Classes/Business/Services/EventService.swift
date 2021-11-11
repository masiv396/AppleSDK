//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 16/09/21.
//

class EventService{
    
    var eventClient: EventClient = EventClient()
    
    func registerEvent(masivNotification: MasivNotification, masivEventType: MasivEventType, token: String,
                       country: String, masivPlatform: MasivPlatform,  externalAppId: String){
        
        var masivEvent: MasivEvent
        masivEvent = MasivEvent(
            cellphone: masivNotification.cellphone,
            creationDate:  masivNotification.creationDate,
            sentDate: masivNotification.sentDate,
            platform: masivPlatform,
            token: token,
            eventType: masivEventType,
            applicationId: externalAppId,
            campaignId: masivNotification.campaignId,
            eventTimestamp: createEventTimeStamp(),
            location: country,
            imageUrl: masivNotification.imageUrl,
            campaignName:masivNotification.campaignName,
            notificationId: masivNotification.notificationId,
            isTrial: masivNotification.isTrial
        )
        eventClient.sentEvent(masivEvent: masivEvent)
    }
    
    fileprivate func createEventTimeStamp() -> String{
        let timeStamp = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter.string(from: timeStamp)
    }
}
