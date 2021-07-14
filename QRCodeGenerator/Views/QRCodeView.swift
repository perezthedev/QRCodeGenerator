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
    
    // not sure which format is best practice for iOS
    @State private var offset = CGSize.zero
    @State private var lastPosition: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color(UIColor.secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            
            Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 150, height: 150, alignment: .center)
                .offset(x: offset.width + lastPosition.width, y: offset.height + lastPosition.height) // added to make QR readable
                .gesture(dragGesture)
                .shadow(radius: 2)
            
            Text("A line of text")
        }
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
    
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                self.offset = value.translation
            }
            .onEnded { value in
                self.lastPosition.width += value.translation.width
                self.lastPosition.height += value.translation.height
                self.offset = .zero
            }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        QRCodeView(url: "www.devnations.com")
    }
}
