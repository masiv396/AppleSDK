//
//  CellphoneClient.swift
//  MasivPushIosSdk
//
//  Created by Masiv on 5/10/21.
//

class CellphoneClient{
    
    let httpClient: HttpClient = HttpClient()
    
    public func sentCellphone(masivCellphone: MasivCellphone){
        let json: [String: Any] = ["token": masivCellphone.token,
                                   "cellphone": masivCellphone.cellphone,
                                   "externalApplicationId": masivCellphone.externalAppId]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        httpClient.sentRequest(url: "https://pushprod.masivapp.com/api/management/cellphones", json: jsonData)
    }
}
