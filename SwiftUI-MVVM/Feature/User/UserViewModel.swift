//
//  UserViewModel.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

class UserViewModel: ObservableObject {
    
    // MARK: Navigation
    enum UserPage: Hashable, CaseIterable, Identifiable {
        case setting
        
        var id: Self { self }
    }

    @Published var page: UserPage? = nil
    
    let settingViewModel = SettingViewModel()
}


// MARK: Navigation
extension UserViewModel {
    
    @ViewBuilder
    func build(page: UserPage) -> some View {
        
        switch page {
        case .setting:
            settingView()
        }
    }
    
    func push(to page: UserPage) {
        self.page = page
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func settingView() -> some View {
        SettingView()
            .environmentObject(settingViewModel)
    }
}
