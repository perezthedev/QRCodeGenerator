//
//  QRCodeView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/5/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    
    @Binding var website:String
    @Binding var name:String
    @Binding var message:String
    @Binding var contactInfo:String
    
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
            VStack {
                
                Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 150, height: 150, alignment: .center)
                    .offset(x: offset.width + lastPosition.width, y: offset.height + lastPosition.height) // added to make QR readable
                    .gesture(dragGesture)
                    .shadow(radius: 2)
                
                Text("\(name)")
                
                Text("\(message)")
                
                Text("\(contactInfo)")
            }
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

/*struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        QRCodeView(website: self.$qrCode.website, name: self.$qrCode.name, message: self.$qrCode.message, contactInfo: self.$qrCode.contactInfo, url: "www.devnations.com")
    }
}
*/
/*
 
 VStack(spacing: 10){
     
     
     Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 150, height: 150, alignment: .center)
         .offset(x: qrOffset.width + qrLastPosition.width, y: qrOffset.height + qrLastPosition.height) // added to make QR readable
         .gesture(DragGesture()
                     .onChanged ({ value in
                         self.qrOffset = value.translation
                     })
                     .onEnded ({ value in
                         self.qrLastPosition.width += value.translation.width
                         self.qrLastPosition.height += value.translation.height
                         self.qrOffset = .zero
                     })
         )
     
     Text("\(name)")
         .offset(x: nameOffset.width + nameLastPosition.width, y: nameOffset.height + nameLastPosition.height) // added to make QR readable
         .gesture(DragGesture()
                     .onChanged ({ value in
                         self.nameOffset = value.translation
                     })
                     .onEnded ({ value in
                         self.nameLastPosition.width += value.translation.width
                         self.nameLastPosition.height += value.translation.height
                         self.nameOffset = .zero
                     })
         )
     
     Text("\(message)")
         .offset(x: messageOffset.width + messageLastPosition.width, y: messageOffset.height + messageLastPosition.height) // added to make QR readable
         .gesture(DragGesture()
                     .onChanged ({ value in
                         self.messageOffset = value.translation
                     })
                     .onEnded ({ value in
                         self.messageLastPosition.width += value.translation.width
                         self.messageLastPosition.height += value.translation.height
                         self.messageOffset = .zero
                     })
         )
     
     Text("\(contactInfo)")
         .offset(x: contactInfoOffset.width + contactInfoLastPosition.width, y: contactInfoOffset.height + contactInfoLastPosition.height) // added to make QR readable
         .gesture(DragGesture()
                     .onChanged ({ value in
                         self.contactInfoOffset = value.translation
                     })
                     .onEnded ({ value in
                         self.contactInfoLastPosition.width += value.translation.width
                         self.contactInfoLastPosition.height += value.translation.height
                         self.contactInfoOffset = .zero
                     })
         )
 }
 
 */
