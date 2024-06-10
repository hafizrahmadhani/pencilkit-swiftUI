//
//  ContentView.swift
//  PencilKit Sadness Scribe
//
//  Created by Hafiz Rahmadhani on 07/05/24.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @Binding var savedDrawings: [MyDrawing]
    @State var canvasView: PKCanvasView = PKCanvasView()
    @State var isGridHidden = false
    
    var body: some View {
        ZStack{
            Color(.yellow)
            VStack {
                Button("", systemImage: "eye"){
                    isGridHidden.toggle()
                }
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                .padding(.top, 10.0)
                ZStack{
                    RoundedRectangle(cornerRadius: 50).foregroundStyle(.white).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Image("canvas grid").resizable().padding(50).opacity(isGridHidden ? 0.0 : 0.3)
                    PKCanvasViewRepresentable(canvasView: $canvasView).padding(50)
                }
                
            }
            .padding([.leading, .bottom, .trailing], 50)
            .padding([.top], 30)
        }
        .onDisappear {
            savedDrawing()
        }
        
        
    }
    
    func savedDrawing(){
        savedDrawings.append(MyDrawing(drawing: canvasView.drawing))
    }

}


#Preview {
    DrawingView(savedDrawings: .constant([]))
}
