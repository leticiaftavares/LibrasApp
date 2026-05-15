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
    
    var handleVideoData: (Data?) -> Void
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItem, matching: .videos, photoLibrary: .shared()) {
                if movieUrl == nil {
                    Text("Selecione um Vídeo")
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(.blue))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
            if let url =  movieUrl {
                Text("Enviado com Sucesso!")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(.blue))
                    .frame(maxWidth: .infinity, alignment: .center)
//                VideoPlayer(player: AVPlayer(url: url))
//                    .cornerRadius(10)
//                    .padding()
//                    .background(Color.clear)
//                    .frame(width: 80, height: 100, alignment: .center)

            }
            
        }
        .onChange(of: pickerItem) {
            Task {
                if let loaded = try? await pickerItem?.loadTransferable(type: TransferableVideo.self) {
                    movieUrl = loaded.url
                    await convert_to_data()
                    print("video baixado")
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
    
    func convert_to_data()  async {
        if movieUrl != nil {
            do{
                let (data, _) = try! await URLSession.shared.data(from: movieUrl!)
                handleVideoData(data)
            } catch{
                print(error)
            }
        }

    }

}

#Preview {
    PhotoPickerDemo() { data in
        print("Achou a imagem!")
    }
}
