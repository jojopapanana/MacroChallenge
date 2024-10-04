//
//  PhotoCard.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 02/10/24.
//

import SwiftUI
import PhotosUI

struct PhotoCard: View {
    @State var chosenPhoto: PhotosPickerItem?
    @State var displayCloth: UIImage?
    @State var galleryUpload: Bool = false
    @State var cameraUpload: Bool = false
    
    var width = 166.5
    
    var body: some View {
        ZStack {
            if displayCloth != nil {
                ZStack {
                    Image(uiImage: displayCloth!)
                        .resizable()
                        .scaledToFill()
                    
                    Image(systemName: "trash.circle.fill")
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .black)
                }
                .onTapGesture {
                    displayCloth = nil
                }
            } else {
                Menu {
                    Button {
                        cameraUpload.toggle()
                    } label: {
                        Label("Take Photo", systemImage: "camera")
                    }
                    
                    Button {
                        galleryUpload.toggle()
                    } label: {
                        Label("Choose Photo", systemImage: "photo.on.rectangle")
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 1.78)
                            .foregroundColor(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 1.78)
                                    .inset(by: 0.35)
                                    .stroke(.black, style: StrokeStyle(lineWidth: 0.35, dash: [3.54, 1.77]))
                            )
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .frame(width: width, height: (width/3)*4)
        .clipped()
        .shadow(color: .black.opacity(displayCloth == nil ? 0 : 0.25), radius: 0.41, x: 0.41, y: 0.41)
        .shadow(color: .black.opacity(displayCloth == nil ? 0 : 0.25), radius: 0.41, x: -0.41, y: -0.41)
        .photosPicker(
            isPresented: $galleryUpload,
            selection: $chosenPhoto,
            matching: .any(of: [.images, .screenshots])
        )
        .fullScreenCover(isPresented: $cameraUpload) {
            ImagePicker(chosenImage: $displayCloth)
                .ignoresSafeArea()
        }
        .onChange(of: chosenPhoto) { oldValue, newValue in
            Task {
                if let photo = try? await chosenPhoto?.loadTransferable(type: Data.self) {
                    displayCloth = UIImage(data: photo)
                }
            }
        }
    }
}

#Preview {
    PhotoCard()
}
