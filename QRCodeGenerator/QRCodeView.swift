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
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                self.offset = value.translation
            }
            .onEnded { value in
                self.offset = value.translation
            }
            
        
        Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 150, height: 150, alignment: .center)
            .offset(x: offset.width, y: offset.height)
            .gesture(dragGesture)
            
            Text("Here is your QR Code!")
                
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
        QRCodeView(url: "www.devnations.com")
    }
}
