//
//  MainApp.swift
//  MedievalWar
//
//  Created by Geovana Contine on 28/03/24.
//

import SwiftUI

@main
struct MainApp: App {
    
    let scene = MedievalWarGame()
    
    var body: some Scene {
        WindowGroup {
            AppleGameView()
        }
    }
}
