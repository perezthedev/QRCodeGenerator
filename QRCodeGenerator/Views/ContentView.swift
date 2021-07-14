//
//  ContentView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var qrCode = QRCode()
    
    @State var website: String = ""
    @State var message: String = ""
    var body: some View {
        NavigationView {
            ZStack{
               // Color(#colorLiteral(red: 0.9198423028, green: 0.9198423028, blue: 0.9198423028, alpha: 1))
                Color(UIColor.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(alignment: .center){
                        Text("URL Link:")
                            .bold()
                        TextField("Enter your website", text: self.$qrCode.website)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color.black)
                    }.padding().shadow(radius: 1)
                    
                    HStack(alignment: .center){
                        Text("Name:")
                            .bold()
                        TextField("Enter your name (optional)", text: $message)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }.padding().shadow(radius: 1)
                    
                    HStack(alignment: .center){
                        Text("Message:")
                            .bold()
                        TextField("Enter your message (optional)", text: $message)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }.padding().shadow(radius: 1)
                    
                    HStack(alignment: .center){
                        Text("Contact Info:")
                            .bold()
                        TextField("Enter contact info (optional)", text: $message)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }.padding().shadow(radius: 1)
                    //Missing arguments for parameters 'website', 'name', 'message', 'contactInfo' in call
                    // creates QR Code button, leading to QR View
                    NavigationLink(destination: QRCodeView(website: self.$qrCode.website, name: self.$qrCode.name, message: self.$qrCode.message, contactInfo: self.$qrCode.contactInfo, url: "\(self.$qrCode.website)"), label: {
                        Text("Create QR Code")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                    })
                }
                .navigationBarTitle("QR Code Generator", displayMode: .large)
                .offset(y:-70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
