//
//  dragObjects.swift
//  QRCodeGenerator
//
//  Created by thepercussivedev on 7/19/21.
//

import SwiftUI

class dragObjects:ObservableObject{
    
    @State private var qrOffset = CGSize.zero
    @State private var qrLastPosition: CGSize = .zero
    
    var drag: some Gesture{
        DragGesture()
            .onChanged ({ value in
                self.qrOffset = value.translation
            })
            .onEnded ({ value in
                self.qrLastPosition.width += value.translation.width
                self.qrLastPosition.height += value.translation.height
                self.qrOffset = .zero
            })
    }
    
}
