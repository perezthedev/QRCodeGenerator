//
//  QRCode.swift
//  QRCodeGenerator
//
//  Created by thepercussivedev on 7/10/21.
//

import Combine

class QRCode:ObservableObject{
    @Published var website = "www.devnations.com"
    @Published var name:String = ""
    @Published var message:String = ""
    @Published var contactInfo:String = ""
}
