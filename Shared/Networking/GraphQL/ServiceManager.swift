//
//  ServiceManager.swift
//  GraphQL
//
//  Created by Pallab Maiti on 16/03/21.
//

import Foundation
import Apollo
import RxSwift
import RxCocoa

class ServiceManager {
    static let sharedClient: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        store.cacheKeyForObject = { $0["id"] }
        let client = URLSessionClient(sessionConfiguration: .default)
        let provider = LegacyInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.spacex.land/graphql")!
        let normalTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: normalTransport, store: store)
    }()
}

extension ServiceManager {
     class func request<Query: GraphQLQuery>(_ query: Query) -> Single<Query.Data?> {
        return Single<Query.Data?>.create { observer in
            ServiceManager.sharedClient.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    observer(.success(graphQLResult.data))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return Disposables.create()
        }
     }
}
