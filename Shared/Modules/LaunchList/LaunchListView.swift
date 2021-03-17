//
//  ContentView.swift
//  Shared
//
//  Created by Pallab Maiti on 15/03/21.
//

import SwiftUI
import Apollo
import RxSwift
import RxCocoa

struct LaunchListView: View {
    @ObservedObject var viewModel = LaunchListViewModel()
    
    init() {
        let input = LaunchListViewModel.Input(fetchLaunchList: Observable.just(Void.self).mapToVoid().asDriverOnErrorJustComplete())
        let _ = viewModel.transform(input: input)
    }
    
    var body: some View {
        if viewModel.showHUD == true {
            ActivityIndicatorView(isAnimating: self.$viewModel.showHUD)
        } else {
            ActivityIndicatorView(isAnimating: self.$viewModel.showHUD)
                .isHidden(true, remove: true)
        }
        NavigationView {
            List {
                ForEach(viewModel.launchList, id: \.id) { launch in
                    LaunchCell(launch: launch)
                }
            }
            .environment(\.defaultMinListRowHeight, 60)
            .listSeparatorStyleNone()
            .navigationBarTitle("SpaceX Launch List")
        }
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 6s"))
    }
}
