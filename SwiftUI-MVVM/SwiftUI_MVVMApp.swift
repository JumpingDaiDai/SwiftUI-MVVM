//
//  SwiftUI_MVVMApp.swift
//  SwiftUI-MVVM
//
//  Created by DaiDai on 2023/9/1.
//

import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    
    let homeViewModel = HomeViewModel(webService: WebService())
    
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: homeViewModel)
        }
    }
}
