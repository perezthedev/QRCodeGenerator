//
//  QRCodeView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/5/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url : String
    
    var body: some View {
        Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 150, height: 150, alignment: .center)
    }
    
    func generateQRCodeImage(_ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
