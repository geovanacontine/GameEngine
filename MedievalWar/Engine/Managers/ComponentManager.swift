import Foundation

struct ComponentStore<T> {
    var components: [T?]
}

class ComponentManager {
    
    // Data
    var stores: [String: UnsafeMutableRawPointer] = [:]
}

// MARK: - Internal

extension ComponentManager {
    func register(_ components: [Component.Type]) {
        removeAllComponents()
        components.forEach { registerComponent(ofType: $0) }
    }
    
    func removeAllComponents(forEntity id: Int) {
        for componentKey in stores.keys {
            let pointer: UnsafeMutablePointer<ComponentStore<Any>> = componentStorePointer(forKey: componentKey)
            pointer.pointee.components[id] = nil
        }
    }
    
    func updateComponents(with newComponents: [Component]) {
        for componentKey in stores.keys {
            let newComponent = newComponents.first(where: { $0.id == componentKey })
            let pointer: UnsafeMutablePointer<ComponentStore<Any>> = componentStorePointer(forKey: componentKey)
            pointer.pointee.components.append(newComponent)
        }
    }
    
    func registerComponent<T: Component>(ofType type: T.Type) {
        let pointer = makeComponentStorePointer(forType: type)
        stores.updateValue(pointer, forKey: type.id)
    }
    
    func removeAllComponents() {
        for component in stores.values { component.deallocate() }
        stores = [:]
    }
}

// MARK: - Private

extension ComponentManager {
    func makeComponentStorePointer<T: Component>(forType type: T.Type) -> UnsafeMutableRawPointer {
        let stride = MemoryLayout<ComponentStore<T>>.stride
        let alignment = MemoryLayout<ComponentStore<T>>.alignment

        let rawPointer = UnsafeMutableRawPointer.allocate(byteCount: stride, alignment: alignment)
        
        let store = ComponentStore<T>(components: [])
        rawPointer.initializeMemory(as: ComponentStore<T>.self, to: store)
        
        return rawPointer
    }
    
    func componentStorePointer<T: Component>(forType type: T.Type) -> UnsafeMutablePointer<ComponentStore<T>> {
        componentStorePointer(forKey: type.id)
    }
    
    func componentStorePointer<T>(forKey key: String) -> UnsafeMutablePointer<ComponentStore<T>> {
        let rawPointer = stores[key]!
        let storePointer = rawPointer.assumingMemoryBound(to: ComponentStore<T>.self)
        return storePointer
    }
}
