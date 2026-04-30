//
//  LibrasAppApp.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData
import AVKit

struct DemoVideo: View {
    
    @State var player: AVPlayer?
    
    var body: some View {
        VideoPlayer(player: player)
            .task {
                let url = Bundle.main.url(forResource: "Act", withExtension: "mov")
                player = AVPlayer(url: url!)
            }
    }
}

@main
struct LibrasAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView_()
        }
    }
}
