import Foundation

final class Container {
    static let shared = Container()
    private init() {}

    private var factories: [ObjectIdentifier: () -> Any] = [:]
    private var instances: [ObjectIdentifier: Any] = [:]

    func register<T>(_ factory: @escaping () -> T) {
        factories[ObjectIdentifier(T.self)] = factory
    }

    func resolve<T>() -> T {
        let key = ObjectIdentifier(T.self)
        if let instance = instances[key] as? T {
            return instance
        }
        guard let factory = factories[key]?() as? T else {
            fatalError("No factory for \(T.self)")
        }
        instances[key] = factory
        return factory
    }
}