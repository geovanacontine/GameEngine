import Foundation

extension ComponentManager {
    func fetch<T: Component>(_ type: T.Type, completion: (inout T?) -> Void) {
        let pointer = componentStorePointer(forType: type)
        
        for index in 0..<pointer.pointee.components.count {
            completion(&pointer.pointee.components[index])
        }
    }
    
    func fetch<A: Component, B: Component>(
        _ a: A.Type,
        _ b: B.Type,
        completion: (inout A?, inout B?) -> Void
    ) {
        let pointerA = componentStorePointer(forType: a)
        let pointerB = componentStorePointer(forType: b)
        
        let count = pointerA.pointee.components.count
        
        for index in 0..<count {
            completion(
                &pointerA.pointee.components[index],
                &pointerB.pointee.components[index]
            )
        }
    }
    
    func fetch<A: Component, B: Component, C: Component>(
        _ a: A.Type,
        _ b: B.Type,
        _ c: C.Type,
        completion: (inout A?, inout B?, inout C?) -> Void
    ) {
        let pointerA = componentStorePointer(forType: a)
        let pointerB = componentStorePointer(forType: b)
        let pointerC = componentStorePointer(forType: c)
        
        let count = pointerA.pointee.components.count
        
        for index in 0..<count {
            completion(
                &pointerA.pointee.components[index],
                &pointerB.pointee.components[index],
                &pointerC.pointee.components[index]
            )
        }
    }
    
    func fetch<A: Component, B: Component, C: Component, D: Component>(
        _ a: A.Type,
        _ b: B.Type,
        _ c: C.Type,
        _ d: D.Type,
        completion: (inout A?, inout B?, inout C?, inout D?) -> Void
    ) {
        let pointerA = componentStorePointer(forType: a)
        let pointerB = componentStorePointer(forType: b)
        let pointerC = componentStorePointer(forType: c)
        let pointerD = componentStorePointer(forType: d)
        
        let count = pointerA.pointee.components.count
        
        for index in 0..<count {
            completion(
                &pointerA.pointee.components[index],
                &pointerB.pointee.components[index],
                &pointerC.pointee.components[index],
                &pointerD.pointee.components[index]
            )
        }
    }
}
