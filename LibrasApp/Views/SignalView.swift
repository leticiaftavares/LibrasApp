//
//  SignalView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI
import Nuvem
import AVKit
import CloudKit

struct SignalView: View {
    
    @Bindable var sign: Sign.Observable
    
    @State var player: AVPlayer?
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Text(sign.fullName ?? "fullname")
                        .font(Font.system(size: 18))
                        .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                        .padding(.horizontal, 18)
                VStack {
                    VideoPlayer(player: player)
                        .frame(width: 160, height: 240)
                        .cornerRadius(10)
                        .padding()
                    MeaningButton(sign: sign)
                        .padding(20)
                    HandSettingsButton(sign: sign)
                }
                .padding(.bottom, 100)
                .navigationTitle(Text(sign.name))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blueBackground)
        }
        .task {
            
            let cacheURL = URL.cachesDirectory.appendingPathComponent("\(sign.name.lowercased()).mov")
            // "LibrasApp/cache/act.mov"
            
            if FileManager.default.fileExists(atPath: cacheURL.path(percentEncoded: false)) {
                print("loading from cache...")
                player = AVPlayer(url: cacheURL)
                return
            }
            
            do {
                print("loading from cloud...")
                try await $sign.$video.load(on: .default)
                guard let assetURL = sign.$video.asset?.fileURL else {
                    return
                }
                do {
                    try FileManager.default.copyItem(at: assetURL, to: cacheURL)
                    player = AVPlayer(url: cacheURL)
                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
        }
    }
}

struct SignalView_Preview: View {
    var body: some View {
        SignalView(
            sign: Sign(
                name: "Sinal",
                video: nil,
                category: "category",
                handSettings:[UIImage()],
                meaning: "meaning",
                tag: ["tag"],
                fullName: "FullName"
            ).observable
        )
    }
}
#Preview {
    SignalView_Preview()
}
