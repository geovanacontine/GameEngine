//
//  FlyweightFactory.swift
//  MetalTutorial
//
//  Created by Geovana Contine on 20/05/24.
//

import Foundation

class FlyweightFactory<T, E> where E.RawValue == String, E: Hashable & RawRepresentable {
    
    private var cache: [E: T] = [:]
    
    func object(ofType objectType: E) throws -> T {
        if let cachedObject = cache[objectType] { return cachedObject }
        
        let newObject = try makeObject(ofType: objectType)
        cache.updateValue(newObject, forKey: objectType)
        return newObject
    }
    
    internal func makeObject(ofType objectType: E) throws -> T {
        fatalError("Missing override")
    }
}
