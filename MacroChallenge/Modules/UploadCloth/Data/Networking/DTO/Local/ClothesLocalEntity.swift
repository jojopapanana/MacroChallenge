//
//  ClothesLocalEntity.swift
//  MacroChallenge
//
//  Created by Jovanna Melissa on 03/10/24.
//

import Foundation
import SwiftData

@Model
class ClothesLocalEntity {
    @Attribute var id: String
    @Attribute var images: [String]
    @Attribute var clothesType: [String]
    @Attribute var clothesQty: Int
    @Attribute var additionalNotes: String
    
    init(images:[String], clothesType:[String], clothesQty:Int, additionalNotes:String) {
        self.id = UUID().uuidString
        self.images = images
        self.clothesType = clothesType
        self.clothesQty = clothesQty
        self.additionalNotes = additionalNotes
    }
    
    func toDomain() -> UploadClothModel {
        return .init(
            id: self.id, images: self.images, clothesType: self.clothesType, clothesQty: self.clothesQty, additionalNotes: self.additionalNotes
        )
    }
}
