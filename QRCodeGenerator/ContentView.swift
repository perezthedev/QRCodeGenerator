//
//  ContentView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(.subheadline)
                HStack {
                    Text("RCB Tech!")
                        .font(.title)
                    Spacer()
                    Text("Nevada")
                        .font(.subheadline)
                    
                }
                Divider()
                Text("About information here")
                    .font(.title2)
                
                Text("Descriptor goes here.")
            }
            .padding()
            Spacer()
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
