//
//  Image_Picker_DemoApp.swift
//  Image Picker Demo
//
//  Created by Ben Anderson on 10/3/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

@main
struct Image_Picker_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
