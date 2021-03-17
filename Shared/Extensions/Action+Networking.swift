//
//  Action+Networking.swift
//  GraphQL
//
//  Created by Pallab Maiti on 16/03/21.
//

import Foundation
import Action
import RxSwift
import Apollo

extension Action where Input == Void, Element == Void {
    class Networking {
        lazy var fetchLaunchListAction: Action<Void, LaunchListQuery.Data?> = {
            return Action<Void, LaunchListQuery.Data?> { _ in
                return ServiceManager.request(LaunchListQuery())
            }
        }()        
    }
}
