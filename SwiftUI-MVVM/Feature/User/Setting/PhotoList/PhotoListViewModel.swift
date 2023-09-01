//
//  PhotoListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by jason_chung on 2023/9/1.
//

import Foundation

class PhotoListViewModel: ObservableObject {
    
    @Published var imageNameList = [
        "tree.fill",
        "pawprint.fill",
        "fish.fill",
        "lightbulb.fill"
    ]
}
