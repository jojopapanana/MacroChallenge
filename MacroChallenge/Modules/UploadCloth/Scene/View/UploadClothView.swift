//
//  UploadClothViewController.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 01/10/24.
//

import SwiftUI
import SwiftData

struct UploadClothView: View {
    @StateObject private var vm = UploadClothViewModel(usecase: DefaultUploadClothUseCase(repository: UploadClothRepository()))
    @Query private var baju:[ClothesLocalEntity]
    
    var body: some View {
        VStack {
            Button("Upload Cloth") {
                vm.upload(images: ["Baju1.jpg", "Baju2.jpg"], clothesType: ["T-shirt", "Shirt"], clothesQty: 10, additionalNotes: "bajunya bagus semua")
            }
            
            if (vm.uploadResult != nil) == true {
                Text("Berhasil upload")
            } else {
                Text("Gagal huhuuu")
            }
            
            if baju.isEmpty {
                Text("Kosong weii")
            } else {
                ForEach(baju){baju in
                    Text(baju.additionalNotes)
                }
            }
        }
    }
}

#Preview {
    UploadClothView()
}
