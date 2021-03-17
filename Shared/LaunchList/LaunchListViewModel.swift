//
//  LaunchListViewModel.swift
//  GraphQL
//
//  Created by Pallab Maiti on 16/03/21.
//

import Foundation
import RxSwift
import Action
import RxCocoa
import Apollo

class LaunchListViewModel: ObservableObject {
    @Published var launchList = [LaunchFragment]()
    @Published var showHUD = true
    let actionNetworking = CocoaAction.Networking()
    let disposeBag = DisposeBag()
    
    init() {
        actionNetworking.fetchLaunchListAction.elements
            .subscribe ( onNext: { data in
                if let data = data?.launchesPast {
                    var list = [LaunchFragment]()
                    for item in data {
                        if let launchFragment = item?.fragments.launchFragment {
                            list.append(launchFragment)
                        }
                    }
                    self.launchList = list
                    self.showHUD = false
                }
            }).disposed(by: disposeBag)
        
        fetchLaunchList()
    }
    
    private func fetchLaunchList() {
        actionNetworking.fetchLaunchListAction.execute()
    }
}
