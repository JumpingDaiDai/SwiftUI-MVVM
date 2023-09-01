//
//  PhotoListView.swift
//  SwiftUI-MVVM
//
//  Created by jason_chung on 2023/9/1.
//

import SwiftUI

struct PhotoListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var photoListViewModel: PhotoListViewModel
    @ObservedObject var settingViewModel: SettingViewModel
    
    var body: some View {
        List {
            ForEach(photoListViewModel.imageNameList, id: \.self) { imageName in
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .onTapGesture {
                        settingViewModel.photo = imageName
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(photoListViewModel: PhotoListViewModel(), settingViewModel: SettingViewModel())
    }
}
