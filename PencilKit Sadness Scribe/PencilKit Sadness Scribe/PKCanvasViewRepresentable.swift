//
//  PKCanvasViewRepresentable.swift
//  PencilKit Sadness Scribe
//
//  Created by Hafiz Rahmadhani on 07/05/24.
//

import Foundation
import SwiftUI
import PencilKit

struct PKCanvasViewRepresentable: UIViewRepresentable{
    @Binding var canvasView: PKCanvasView
    var toolPicker: PKToolPicker = PKToolPicker()
    
    func makeUIView(context: Context)-> some UIView{
        canvasView.becomeFirstResponder()
        canvasView.isOpaque = false
        return canvasView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context){
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: uiView)
    }
}
