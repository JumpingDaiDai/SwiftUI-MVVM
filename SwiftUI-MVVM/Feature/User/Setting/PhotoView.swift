//
//  PhotoView.swift
//  SwiftUI-MVVM
//
//  Created by jason_chung on 2023/9/1.
//

import SwiftUI

struct PhotoView: View {
    
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    var body: some View {
        Image(systemName: (settingViewModel.photo != "") ? settingViewModel.photo : "photo")
            .resizable()
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)
            .padding(50)
            .onTapGesture {
                settingViewModel.push(to: .photoList)
            }
        
        // 在 superview 或是 subview 中做 navigation 都可以
//        bindingNavigation(to: .photoList, selection: $settingViewModel.page, viewModel: settingViewModel)
    }
}

extension PhotoView {
    
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

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
