//
//  DependencyInjection.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 21/10/21.
//

import Foundation

public protocol CosmosDependency {}

protocol CosmosStoreInterface {
    func get<T>(_ arg: T.Type) -> T?
    func register<T>(_ arg: CosmosDependency, forMetaType metaType: T.Type)

    static var shared: CosmosStoreInterface { get }

    var theme: CosmosTheme { get set }
    var brandLibrary: BrandLibrary { get set }
    var allowSystemTheme: Bool { get set }
}

@propertyWrapper
final class CosmosInjected<T> {
    private(set) var resolvedValue: T?
    /** If this fail, it means that the dependency used was not registered into CosmosStore.
         To do this, simply call `Cosmos.register` passing the instance and type of the Dependency at the start of your module
     */
    public var wrappedValue: T {
        guard let resolvedValue = resolvedValue else {
            preconditionFailure("Attempted to resolve \(type(of: self)), but there's nothing registered for this type.")
        }

        return resolvedValue
    }

    public init() {
        if let value = Cosmos.get(T.self) {
            resolvedValue = value
        }
    }
}
