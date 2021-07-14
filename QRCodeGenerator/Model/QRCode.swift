//
//  QRCode.swift
//  QRCodeGenerator
//
//  Created by thepercussivedev on 7/10/21.
//

import Combine

final class QRCode:ObservableObject{
    @Published var website = "www.devnations.com"
    @Published var name:String = ""
    @Published var message:String = ""
    @Published var contactInfo:String = ""
}
