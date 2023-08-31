//
//  SettingViewModel.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

class SettingViewModel: ObservableObject {
    
    // MARK: Navigation
    enum SettingPage: Hashable {
        case favorite
    }
    
    @Published var page: SettingPage? = nil
    
//    @Published var favorite: String = ""
}

// MARK: Navigation
extension SettingViewModel {
    
    @ViewBuilder
    func build(page: SettingPage) -> some View {
        
        switch page {
        case .favorite:
            favoriteView()
        }
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func favoriteView() -> some View {
        let favoriteViewModel = FavoriteViewModel()
//        FavoriteView(favoriteViewModel: favoriteViewModel, favorite: $favorite)
        FavoriteView(favoriteViewModel: favoriteViewModel)
    }
}
