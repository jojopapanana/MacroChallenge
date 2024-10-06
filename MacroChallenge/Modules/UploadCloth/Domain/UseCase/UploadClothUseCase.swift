// 
//  UploadClothUseCase.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 01/10/24.
//

import Foundation
import Combine

protocol UploadClothUseCase {
    func save(param: UploadClothParameter) -> Task<Bool, Never>
}

internal final class DefaultUploadClothUseCase: UploadClothUseCase {
    
    private let repository: UploadClothRepository
    
    init(
        repository: UploadClothRepository
    ) {
        self.repository = repository
    }
    
    func save(param: UploadClothParameter) -> Task<Bool, Never> {
        repository.save(param: param.toRequest())
    }
}
