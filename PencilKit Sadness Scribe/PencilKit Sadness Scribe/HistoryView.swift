//
//  HistoryView.swift
//  PencilKit Sadness Scribe
//
//  Created by Hafiz Rahmadhani on 07/05/24.
//

import SwiftUI

struct HistoryView: View {
    @State var savedDrawings: [MyDrawing] = []
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(savedDrawings, id: \.id){
                        myDrawing in ZStack{
                            RoundedRectangle(cornerRadius: 20).foregroundStyle(.white)
                            Image(uiImage: myDrawing.createThumbnail()).resizable().frame(maxWidth: 300)
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("My Drawing")
            .toolbar(content: {
                NavigationLink{
                    DrawingView(savedDrawings: $savedDrawings)
                }label:{
                    Text("New Drawing")
                }
            })
        }
    }
}

#Preview {
    HistoryView()
}
