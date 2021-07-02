//
//  ContentView.swift
//  QRCodeGenerator
//
//  Created by RCB Tech on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Text("DevNation!")
                    .font(.title)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Nevada")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
