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
                    self.userViewModel.page = .setting
                }

            NavigationLink(tag: UserViewModel.UserPage.setting, selection: $userViewModel.page) {
                userViewModel.build(page: .setting)
            } label: {
                EmptyView()
            }
        }
        .navigationBarTitle("User", displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userViewModel: UserViewModel())
    }
}
