//
//  QRCode.swift
//  QRCodeGenerator
//
//  Created by PerezTheDev on 7/10/21.
//

import Combine

final class QRCode:ObservableObject{
    @Published var website = "www.devnations.com"
    @Published var name:String = "PerezTheDev"
    @Published var message:String = "This is a message!"
    @Published var contactInfo:String = "(123)456-7890"
}
