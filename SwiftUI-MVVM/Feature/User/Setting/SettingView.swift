//
//  SettingView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var settingViewModel: SettingViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    settingViewModel.page = .favorite
                } label: {
                    Text((settingViewModel.favorite != "") ? settingViewModel.favorite : "Choose Favorite")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
            }

            NavigationLink(tag: SettingViewModel.SettingPage.favorite, selection: $settingViewModel.page) {
                settingViewModel.build(page: .favorite)
            } label: {
                EmptyView()
            }
        }
        .navigationBarTitle("Setting", displayMode: .inline)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingViewModel: SettingViewModel())
    }
}
