//
//  MyDrawing.swift
//  PencilKit Sadness Scribe
//
//  Created by Hafiz Rahmadhani on 07/05/24.
//

import Foundation
import PencilKit

struct MyDrawing: Identifiable{
    var drawing: PKDrawing
    var id = UUID()
    
    func createThumbnail() -> UIImage{
        let newImage = drawing.image(from: drawing.bounds, scale: 1)
        return newImage
    }
}
