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
    @State private var qrOffset = CGSize.zero
    @State private var qrLastPosition: CGSize = .zero
    @State private var qrCurrentMagnification: CGFloat = 1
    @GestureState private var qrPinchMagnification: CGFloat = 1
    @State private var nameOffset = CGSize.zero
    @State private var nameLastPosition: CGSize = .zero
    @State private var nameCurrentMagnification: CGFloat = 1
    @GestureState private var namePinchMagnification: CGFloat = 1
    @State private var messageOffset = CGSize.zero
    @State private var messageLastPosition: CGSize = .zero
    @State private var messageCurrentMagnification: CGFloat = 1
    @GestureState private var messagePinchMagnification: CGFloat = 1
    @State private var contactInfoOffset = CGSize.zero
    @State private var contactInfoLastPosition: CGSize = .zero
    @State private var contactInfoCurrentMagnification: CGFloat = 1
    @GestureState private var contactInfoPinchMagnification: CGFloat = 1
    
    var body: some View {
        ZStack{
            Color(UIColor.secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
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
                    .scaleEffect(qrCurrentMagnification * qrPinchMagnification)
                    .gesture(MagnificationGesture()
                                .updating($qrPinchMagnification, body: { (value, state, _) in
                                    state = value
                                })
                                .onEnded({ (value) in
                                    self.qrCurrentMagnification *= value
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
                    .scaleEffect(nameCurrentMagnification * namePinchMagnification)
                    .gesture(MagnificationGesture()
                                .updating($namePinchMagnification, body: { (value, state, _) in
                                    state = value
                                })
                                .onEnded({ (value) in
                                    self.nameCurrentMagnification *= value
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
                    .scaleEffect(messageCurrentMagnification * messagePinchMagnification)
                    .gesture(MagnificationGesture()
                                .updating($messagePinchMagnification, body: { (value, state, _) in
                                    state = value
                                })
                                .onEnded({ (value) in
                                    self.messageCurrentMagnification *= value
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
                    .scaleEffect(contactInfoCurrentMagnification * contactInfoPinchMagnification)
                    .gesture(MagnificationGesture()
                                .updating($contactInfoPinchMagnification, body: { (value, state, _) in
                                    state = value
                                })
                                .onEnded({ (value) in
                                    self.contactInfoCurrentMagnification *= value
                                })
                    )
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
                self.qrOffset = value.translation
            }
            .onEnded { value in
                self.qrLastPosition.width += value.translation.width
                self.qrLastPosition.height += value.translation.height
                self.qrOffset = .zero
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
