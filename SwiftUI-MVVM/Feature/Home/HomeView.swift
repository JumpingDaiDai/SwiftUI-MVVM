//
//  HomeView.swift
//  SwiftUIMVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 50) {
                    Text(homeViewModel.homeModel?.homeInfo ?? "")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.gray)
                    
                    VStack (spacing: 20) {
                        Text("Go to User Page")
                            .onTapGesture {
                                homeViewModel.push(to: .user)
                            }
                    }
                    
                    Button {
                        homeViewModel.fetchHomeData()
                    } label: {
                        Text("fetch home data")
                    }
                }
                
                bindingNavigation(to: .user, selection: $homeViewModel.page, viewModel: homeViewModel)
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

extension HomeView {
    
    @ViewBuilder
    private func bindingNavigation(to page: HomeViewModel.HomePage,
                                   selection:Binding<HomeViewModel.HomePage?>,
                                   viewModel: HomeViewModel) -> some View {
        
        NavigationLink(tag: page, selection: selection) {
            viewModel.build(page: page)
        } label: {
            EmptyView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(webService: WebService()))
    }
}
