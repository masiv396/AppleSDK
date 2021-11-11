//
//  AppDelegate.swift
//  AppleClientMasivian
//
//  Created by Masiv on 28/09/2021

public class MasivPushServices: UIResponder{
    
    let gcmMessageIDKey = "gcm.message_id"
    var country = ""
    var token = ""
    var externalAppId = ""
    var isValidExternalAppId = false
    let locationService: LocationService = LocationService()
    let defaults = UserDefaults.standard
    
    public override init() {
    }
    
    public func registerDataNotification(didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        DispatchQueue.background(delay: 1, background: {
        }, completion: {
            let keyNotification = userInfo[self.gcmMessageIDKey] as! String
            if(!self.isValidExternalAppId){
                NSLog("The external applicationId not valid", self.externalAppId)
            }else if(self.defaults.string(forKey: keyNotification) == nil){
                self.updateLocation()
                NotificationService().registerEventReceived(userInfo: userInfo, country: self.country, token: self.token, externalAppId: self.externalAppId)
                self.defaults.set("true",forKey: keyNotification)
                self.defaults.synchronize()
            }
        })
    }
    
    public func registerEventOpened(didReceive response: UNNotificationResponse){
        let masivNotification = MasivNotification(didReceiveRemoteNotification: response.notification.request.content.userInfo)
        DispatchQueue.background(delay: 1.3, background: {
        }, completion: {
            self.openUrl(clickAction: masivNotification.clickAction)
            self.updateLocation()
            EventService().registerEvent(masivNotification: masivNotification, masivEventType: MasivEventType.Opened, token: self.token, country: self.country, masivPlatform: MasivPlatform.Ios, externalAppId: self.externalAppId)
        })
        DispatchQueue.background(delay: 2.5, completion:{
            self.removeObjectKeyMemory(key: response.notification.request.content.userInfo[self.gcmMessageIDKey] as! String)
        })
    }
    
    public func saveToken(didReceiveRegistrationToken fcmToken: String?) {
          self.startLocationService()
          self.token = String(fcmToken!)
    }
    
    public func registerCellphone(cellphone: String?) {
        if(cellphone == nil || cellphone?.count == 0){
            NSLog("Cellphone number is required to be register", "")
        }else{
            let masivCellphone = MasivCellphone(token: self.token, cellphone: cellphone!, externalAppId: self.externalAppId)
            CellphoneService().registerCellphone(masivCellphone: masivCellphone )
        }
    }
    
    public func isApplicationNotInactive() -> Bool {
        var isActive = false
        if(defaults.string(forKey: "active") == "active"){
            isActive = true
        }
        return isActive
    }
    
    public func setApplicationStatusActive() {
        if (UIApplication.shared.applicationState == .active){
            defaults.set("active",forKey: "active")
        }
    }
    
    public func setApplicationStatusInactive() {
        removeObjectKeyMemory(key: "active")
    }
    
    public func initService(externalAppId: String){
        if(externalAppId.contains("ios")){
            self.externalAppId = externalAppId
            self.isValidExternalAppId = true
            DispatchQueue.background(delay: 2.0, completion:{
                self.updateLocation()
                let masivToken = MasivToken(token: self.token,externalApplicationId: externalAppId, platform: MasivPlatform.Ios )
                TokenService().registerToken(masivToken: masivToken )
            })
        }else{
            NSLog("Your external applicationId must contain the word ios", self.externalAppId)
        }
    }
    
    private func updateLocation() {
        country = country == "Unknown" || country == "" ? locationService.country : country
    }
    
    private func removeObjectKeyMemory(key : String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    private func setObjectKeyMemory(key : String, value: String) {
        defaults.set(value,forKey: key)
        defaults.synchronize()
    }
    
    private func startLocationService() {
        self.locationService.getLocation()
    }
    
    private func openUrl(clickAction : String?) {
        if(!(clickAction == nil)){
            UIApplication.shared.open(NSURL(string: clickAction!)! as URL)
        }
    }
}

extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
