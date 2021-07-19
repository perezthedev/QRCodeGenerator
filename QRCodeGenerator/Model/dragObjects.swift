//
//  dragObjects.swift
//  QRCodeGenerator
//
//  Created by thepercussivedev on 7/19/21.
//

import SwiftUI

class dragObjects:ObservableObject{
    
    @State private var offset = CGSize.zero
    @State private var lastPosition: CGSize = .zero
    
    var drag: some Gesture{
        DragGesture()
            .onChanged ({ value in
                self.offset = value.translation
            })
            .onEnded ({ value in
                self.lastPosition.width += value.translation.width
                self.lastPosition.height += value.translation.height
                self.offset = .zero
            })
    }
    
}
