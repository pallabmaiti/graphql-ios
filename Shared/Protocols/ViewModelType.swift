//
//  ViewModelType.swift
//  GraphQL (iOS)
//
//  Created by Pallab Maiti on 17/03/21.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
