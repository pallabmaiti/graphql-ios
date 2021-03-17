//
//  Observable+Ext.swift
//  GraphQL
//
//  Created by Pallab Maiti on 17/03/21.
//

import RxSwift
import RxCocoa

extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            assertionFailure("Error \(error)")
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
