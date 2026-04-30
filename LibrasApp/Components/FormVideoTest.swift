//
//  FormVideoTest.swift
//  LibrasApp
//
//  Created by User on 28/04/26.
//

import PhotosUI
import SwiftUI
import AVKit


struct TransferableVideo: Transferable {
    let url: URL
    
    enum TransferError: Error {
        case importFailed
    }
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(importedContentType: .movie) { data in
            guard
                let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                print("Cannot access local file domain")
                throw TransferError.importFailed
            }
            
            let filePath = directoryPath
                .appendingPathComponent("movie")
                .appendingPathExtension("mp4")
            do {
                if FileManager.default.fileExists(atPath: filePath.path()) {
                    try FileManager.default.removeItem(at: filePath)
                }
                try FileManager.default.copyItem(at: data.file, to: filePath)
            } catch(let error) {
                print(error)
                throw TransferError.importFailed
            }
            return TransferableVideo(url: filePath)
            
        }
    }
}

struct PhotoPickerDemo: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var movieUrl: URL?
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItem, matching: .videos, photoLibrary: .shared()) {
                Text("Select a Video!")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(.blue))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            if let url =  movieUrl {
                VideoPlayer(player: AVPlayer(url: url))
                    .padding(.bottom, 16)
                    .background(Color.black)
            }
            
        }
        .onChange(of: pickerItem) {
            Task {
                if let loaded = try? await pickerItem?.loadTransferable(type: TransferableVideo.self) {
                    movieUrl = loaded.url
                } else {
                    print("Failed to load image")
                }
            }
        }
        .onDisappear {
            Task {
                if let url = movieUrl {
                    try? FileManager().removeItem(at: url)
                }
            }
        }
    }

}

#Preview {
    PhotoPickerDemo()
}
