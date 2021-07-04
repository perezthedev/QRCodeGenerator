//
//  ContentView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var website: String = ""
    @State var message: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center){
                    Text("URL Link:")
                        .bold()
                    TextField("Enter your website", text: $website)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.black)
                }.padding().shadow(radius: 1)
                
                HStack(alignment: .center){
                    Text("Message:")
                        .bold()
                    TextField("Enter your message (optional)", text: $message)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }.padding().shadow(radius: 1)
            }.navigationBarTitle("QR Code Generator", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
