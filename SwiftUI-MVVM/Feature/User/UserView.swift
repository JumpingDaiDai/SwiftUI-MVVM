//
//  UserView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            Text("Go to Setting")
                .onTapGesture {
                    userViewModel.push(to: .setting)
                }

            bindingNavigation(to: .setting, selection: $userViewModel.page, viewModel: userViewModel)
        }
        .navigationBarTitle("User", displayMode: .inline)
    }
}

// MARK: Navigatable
extension UserView {
    
    /// 用這個方法則 UserPage 需要實作 CaseIterable & Identifiable，
    /// 好處是可以直接建立所有需要的 NavigationLink
    @ViewBuilder
    private func bindingNavigationLinks(userViewModel: UserViewModel) -> some View {

        ForEach(type(of: userViewModel).UserPage.allCases) { page in
            NavigationLink(tag: page, selection: $userViewModel.page) {
                userViewModel.build(page: page)
            } label: {
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    private func bindingNavigation(to page: UserViewModel.UserPage,
                                   selection:Binding<UserViewModel.UserPage?>,
                                   viewModel: UserViewModel) -> some View {
        
        NavigationLink(tag: page, selection: selection) {
            viewModel.build(page: page)
        } label: {
            EmptyView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userViewModel: UserViewModel())
    }
}
