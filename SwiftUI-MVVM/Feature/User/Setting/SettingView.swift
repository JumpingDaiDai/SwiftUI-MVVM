//
//  SettingView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                PhotoView()
                
                Button {
                    settingViewModel.push(to: .favorite)
                } label: {
                    Text((settingViewModel.favorite != "") ? settingViewModel.favorite : "Choose Favorite")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            bindingNavigation(to: .photoList, selection: $settingViewModel.page, viewModel: settingViewModel)
            bindingNavigation(to: .favorite, selection: $settingViewModel.page, viewModel: settingViewModel)
        }
        .navigationBarTitle("Setting", displayMode: .inline)
    }
}

extension SettingView {
    
    @ViewBuilder
    private func bindingNavigation(to page: SettingViewModel.SettingPage,
                                   selection:Binding<SettingViewModel.SettingPage?>,
                                   viewModel: SettingViewModel) -> some View {
        
        NavigationLink(tag: page, selection: selection) {
            viewModel.build(page: page)
        } label: {
            EmptyView()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(SettingViewModel())
    }
}
