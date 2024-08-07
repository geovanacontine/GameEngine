import Foundation

extension EntityManager {
    func forEach<T: Component>(_ type: T.Type, completion: (inout T) -> Void) {
        for archetype in queryArchetypes([type]) {
            let componentIndex = archetype.componentTypes.firstIndex(where: { $0 == type })!
            var componentList = archetype.components[componentIndex] as! [T]
            
            for i in componentList.allElements {
                completion(&componentList[i])
            }
            
            archetype.components[componentIndex] = componentList
        }
    }
    
    func forEach<T1: Component, T2: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        completion: (inout T1, inout T2) -> Void
    ) {
        for archetype in queryArchetypes([type1, type2]) {
            let index1 = archetype.componentTypes.firstIndex(where: { $0 == type1 })!
            let index2 = archetype.componentTypes.firstIndex(where: { $0 == type2 })!
            
            var componentList1 = archetype.components[index1] as! [T1]
            var componentList2 = archetype.components[index2] as! [T2]
            
            for i in componentList1.allElements {
                completion(
                    &componentList1[i],
                    &componentList2[i]
                )
            }
            
            archetype.components[index1] = componentList1
            archetype.components[index2] = componentList2
        }
    }
    
    func forEach<T1: Component, T2: Component, T3: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        _ type3: T3.Type,
        completion: (inout T1, inout T2, inout T3) -> Void
    ) {
        for archetype in queryArchetypes([type1, type2, type3]) {
            let index1 = archetype.componentTypes.firstIndex(where: { $0 == type1 })!
            let index2 = archetype.componentTypes.firstIndex(where: { $0 == type2 })!
            let index3 = archetype.componentTypes.firstIndex(where: { $0 == type3 })!
            
            var componentList1 = archetype.components[index1] as! [T1]
            var componentList2 = archetype.components[index2] as! [T2]
            var componentList3 = archetype.components[index3] as! [T3]
            
            for i in componentList1.allElements {
                completion(
                    &componentList1[i],
                    &componentList2[i],
                    &componentList3[i]
                )
            }
            
            archetype.components[index1] = componentList1
            archetype.components[index2] = componentList2
            archetype.components[index3] = componentList3
        }
    }
    
    func forEach<T1: Component, T2: Component, T3: Component, T4: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        _ type3: T3.Type,
        _ type4: T4.Type,
        completion: (inout T1, inout T2, inout T3, inout T4) -> Void
    ) {
        for archetype in queryArchetypes([type1, type2, type3, type4]) {
            let index1 = archetype.componentTypes.firstIndex(where: { $0 == type1 })!
            let index2 = archetype.componentTypes.firstIndex(where: { $0 == type2 })!
            let index3 = archetype.componentTypes.firstIndex(where: { $0 == type3 })!
            let index4 = archetype.componentTypes.firstIndex(where: { $0 == type4 })!
            
            var componentList1 = archetype.components[index1] as! [T1]
            var componentList2 = archetype.components[index2] as! [T2]
            var componentList3 = archetype.components[index3] as! [T3]
            var componentList4 = archetype.components[index4] as! [T4]
            
            for i in componentList1.allElements {
                completion(
                    &componentList1[i],
                    &componentList2[i],
                    &componentList3[i],
                    &componentList4[i]
                )
            }
            
            archetype.components[index1] = componentList1
            archetype.components[index2] = componentList2
            archetype.components[index3] = componentList3
            archetype.components[index4] = componentList4
        }
    }
    
    func forEach<T1: Component, T2: Component, T3: Component, T4: Component, T5: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        _ type3: T3.Type,
        _ type4: T4.Type,
        _ type5: T5.Type,
        completion: (inout T1, inout T2, inout T3, inout T4, inout T5) -> Void
    ) {
        for archetype in queryArchetypes([type1, type2, type3, type4, type5]) {
            let index1 = archetype.componentTypes.firstIndex(where: { $0 == type1 })!
            let index2 = archetype.componentTypes.firstIndex(where: { $0 == type2 })!
            let index3 = archetype.componentTypes.firstIndex(where: { $0 == type3 })!
            let index4 = archetype.componentTypes.firstIndex(where: { $0 == type4 })!
            let index5 = archetype.componentTypes.firstIndex(where: { $0 == type5 })!
            
            var componentList1 = archetype.components[index1] as! [T1]
            var componentList2 = archetype.components[index2] as! [T2]
            var componentList3 = archetype.components[index3] as! [T3]
            var componentList4 = archetype.components[index4] as! [T4]
            var componentList5 = archetype.components[index5] as! [T5]
            
            for i in componentList1.allElements {
                completion(
                    &componentList1[i],
                    &componentList2[i],
                    &componentList3[i],
                    &componentList4[i],
                    &componentList5[i]
                )
            }
            
            archetype.components[index1] = componentList1
            archetype.components[index2] = componentList2
            archetype.components[index3] = componentList3
            archetype.components[index4] = componentList4
            archetype.components[index5] = componentList5
        }
    }
    
    func forEach<T1: Component, T2: Component, T3: Component, T4: Component, T5: Component, T6: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        _ type3: T3.Type,
        _ type4: T4.Type,
        _ type5: T5.Type,
        _ type6: T6.Type,
        completion: (inout T1, inout T2, inout T3, inout T4, inout T5, inout T6) -> Void
    ) {
        for archetype in queryArchetypes([type1, type2, type3, type4, type5, type6]) {
            let index1 = archetype.componentTypes.firstIndex(where: { $0 == type1 })!
            let index2 = archetype.componentTypes.firstIndex(where: { $0 == type2 })!
            let index3 = archetype.componentTypes.firstIndex(where: { $0 == type3 })!
            let index4 = archetype.componentTypes.firstIndex(where: { $0 == type4 })!
            let index5 = archetype.componentTypes.firstIndex(where: { $0 == type5 })!
            let index6 = archetype.componentTypes.firstIndex(where: { $0 == type6 })!
            
            var componentList1 = archetype.components[index1] as! [T1]
            var componentList2 = archetype.components[index2] as! [T2]
            var componentList3 = archetype.components[index3] as! [T3]
            var componentList4 = archetype.components[index4] as! [T4]
            var componentList5 = archetype.components[index5] as! [T5]
            var componentList6 = archetype.components[index6] as! [T6]
            
            for i in componentList1.allElements {
                completion(
                    &componentList1[i],
                    &componentList2[i],
                    &componentList3[i],
                    &componentList4[i],
                    &componentList5[i],
                    &componentList6[i]
                )
            }
            
            archetype.components[index1] = componentList1
            archetype.components[index2] = componentList2
            archetype.components[index3] = componentList3
            archetype.components[index4] = componentList4
            archetype.components[index5] = componentList5
            archetype.components[index6] = componentList6
        }
    }
}
