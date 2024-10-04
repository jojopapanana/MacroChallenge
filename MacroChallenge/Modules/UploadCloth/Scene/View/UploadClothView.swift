// 
//  UploadClothViewController.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 01/10/24.
//

import SwiftUI

struct UploadClothView: View {
    @State var selectedClothesType: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    UploadPictureView()
                        .padding(.top, 16)
                        .padding(.horizontal)
                        .padding(.bottom, 35)
                    
                    UploadNumberOfClothesView()
                        .padding(.horizontal)
                        .padding(.bottom, 35)
                    
                    UploadClothesTypeView(selectedClothesType: $selectedClothesType)
                        .padding(.horizontal)
                        .padding(.bottom, 35)
                    
                    UploadAdditionalNotesView()
                        .padding(.horizontal)
                        .padding(.bottom, 35)
                    
                }
                // button draft ama continue kalo gak fixed disini
                
                .navigationTitle("Upload")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Image(systemName: "chevron.left"), trailing: Button("Back") {
                    // coding back button harusnya
                })
            }
        }
        // button draft sama continue disini harusnya kalo mau fixed position
        HStack {
            Button(action: {
                // codingan buat ngedraft
            }) {
                Text("Draft")
                    .frame(width: 120, height: 50)
                    .background(selectedClothesType.isEmpty ? Color.gray : Color.clear)
                    .foregroundColor(selectedClothesType.isEmpty ? Color.white : Color.black)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedClothesType.isEmpty ? Color.clear : Color.black, lineWidth: 1)
                    )
            }
            .disabled(selectedClothesType.isEmpty)
            .padding(.all, 12)
            
            Button(action: {
                // coding buat next page
            }) {
                Text("Continue")
                    .frame(width: 220, height: 50)
                    .background(selectedClothesType.isEmpty ? Color.gray : Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
            }
            .disabled(selectedClothesType.isEmpty)
        }
    }
}

#Preview {
    UploadClothView()
}
