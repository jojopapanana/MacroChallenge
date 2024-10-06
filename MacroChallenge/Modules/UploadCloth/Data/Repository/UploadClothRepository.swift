//
//  UploadClothRepository.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 01/10/24.
//

import Foundation
import Combine
import SwiftData

class UploadClothRepository {
    
    private let container = SwiftDataContextManager.shared.container
    
    init() { }
    
    func save(param: UploadClothRequestDTO) -> Task<Bool, Never>{
        Task { @MainActor in
            do {
                let entity = ClothesLocalEntity(images: param.images, clothesType: param.clothesType, clothesQty: param.clothesQty, additionalNotes: param.additionalNotes ?? "")
                
                self.container!.mainContext.insert(entity)
                
                try self.container!.mainContext.save()
                
                return true
            } catch {
                return false
            }
        }
            
    }
}
