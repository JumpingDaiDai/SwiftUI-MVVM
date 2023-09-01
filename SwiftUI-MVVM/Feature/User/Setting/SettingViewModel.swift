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
        case photoList
        case favorite
    }
    
    @Published var page: SettingPage? = nil
    
    @Published var photo: String = ""
    @Published var favorite: String = ""
}

// MARK: Navigation
extension SettingViewModel {
    
    @ViewBuilder
    func build(page: SettingPage) -> some View {
        
        switch page {
        case .photoList:
            photoListView()
        case .favorite:
            favoriteView()
        }
    }
    
    func push(to page: SettingPage) {
        self.page = page
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func photoListView() -> some View {
        let photoListViewModel = PhotoListViewModel()
        PhotoListView(photoListViewModel: photoListViewModel, settingViewModel: self)
    }
    
    @ViewBuilder
    private func favoriteView() -> some View {
        let favoriteViewModel = FavoriteViewModel()
        FavoriteView(favoriteViewModel: favoriteViewModel, settingViewModel: self)
    }
}
