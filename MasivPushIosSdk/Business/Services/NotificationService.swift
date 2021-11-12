//
//  NotificationService.swift
//  AppleClientMasivian
//
//  Created by Masiv on 20/09/21.
//

class NotificationService: NSObject{
    
    let eventService: EventService = EventService()
    
    func registerEventReceived(userInfo: [AnyHashable: Any], country: String, token: String, externalAppId: String) {
      let masivNotification = MasivNotification(didReceiveRemoteNotification: userInfo)
        eventService.registerEvent(masivNotification: masivNotification, masivEventType: MasivEventType.Received, token: token, country: country, masivPlatform: MasivPlatform.Ios, externalAppId: externalAppId)
    }
}
