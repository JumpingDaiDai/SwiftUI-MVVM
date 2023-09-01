//
//  HomeViewModel.swift
//  SwiftUIMVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    // MARK: Navigation
    enum HomePage: Hashable {
        case user
    }
    
    @Published var page: HomePage? = nil
    
    // MARK: Service
    private let webService: WebService
    
    // MARK: Model
    @Published var homeModel: HomeModel? = nil
    
    init(webService: WebService) {
        self.webService = webService
    }
}

// MARK: Interaction
extension HomeViewModel {
    
    func fetchHomeData() {
        webService.fetchHomeData { [weak self] model in
            self?.homeModel = model
        }
    }
}

// MARK: Navigation
extension HomeViewModel {
    
    @ViewBuilder
    func build(page: HomePage) -> some View {
        switch page {
        case .user:
            userView()
        }
    }
    
    func push(to page: HomePage) {
        self.page = page
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func userView() -> some View {
        let userViewModel = UserViewModel()
        UserView(userViewModel: userViewModel)
    }
}
