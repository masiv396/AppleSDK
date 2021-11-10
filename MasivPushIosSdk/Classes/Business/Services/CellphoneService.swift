//
//  CellphoneService.swift
//  MasivPushIosSdk
//
//  Created by Masiv on 5/10/21.
//

class CellphoneService: NSObject{
    
    var cellphoneClient: CellphoneClient = CellphoneClient()

    func registerCellphone(masivCellphone: MasivCellphone){
        cellphoneClient.sentCellphone(masivCellphone: masivCellphone)
    }
}
