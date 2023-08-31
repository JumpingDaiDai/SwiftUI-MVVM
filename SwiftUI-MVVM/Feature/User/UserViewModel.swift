//
//  UserViewModel.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

class UserViewModel: ObservableObject {
    
    // MARK: Navigation
    enum UserPage: Hashable {
        case setting
    }
    
    @Published var page: UserPage? = nil
    
    @ObservedObject var settingViewModel = SettingViewModel()
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
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func settingView() -> some View {
        SettingView(settingViewModel: settingViewModel)
    }
}
