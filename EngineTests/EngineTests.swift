//
//  EngineTests.swift
//  EngineTests
//
//  Created by Geovana Contine on 04/06/24.
//

@testable import MedievalWar
import XCTest

final class EngineTests: XCTestCase {

    func testArchetype() {
        
        // Setup archetype
        let archetype = Archetype(with: [Position.self, Rotation.self])
        
        // Add Entity 1
        let position1 = Position(x: 0, y: 0, z: 0)
        let rotation1 = Rotation(x: 0, y: 0, z: 0)
        let entity1: [any Component] = [position1, rotation1]
        _ = archetype.moveEntityIn(entity1)
        
        // Add Entity 2
        let position2 = Position(x: 1, y: 1, z: 1)
        let rotation2 = Rotation(x: 1, y: 1, z: 1)
        let entity2: [any Component] = [position2, rotation2]
        _ = archetype.moveEntityIn(entity2)
        
        // Remove entity
        archetype.moveEntityOut(id: 0)
        
        // Add Entity 3
        let position3 = Position(x: 2, y: 2, z: 2)
        let rotation3 = Rotation(x: 2, y: 2, z: 2)
        let entity3: [any Component] = [position3, rotation3]
        _ = archetype.moveEntityIn(entity3)
        
        // Check entities integrity
        let expectedEntities1 = [
            ArchetypeEntity(externalId: 0, internalId: 1),
            ArchetypeEntity(externalId: 1, internalId: 0)
        ]
        XCTAssertEqual(archetype.entities, expectedEntities1)
        
        // Add Entity 4
        let position4 = Position(x: 3, y: 3, z: 3)
        let rotation4 = Rotation(x: 3, y: 3, z: 3)
        let entity4: [any Component] = [position4, rotation4]
        _ = archetype.moveEntityIn(entity4)
        
        // Check entities integrity
        let expectedEntities2 = [
            ArchetypeEntity(externalId: 0, internalId: 1),
            ArchetypeEntity(externalId: 1, internalId: 0),
            ArchetypeEntity(externalId: 2, internalId: 2)
        ]
        XCTAssertEqual(archetype.entities, expectedEntities2)
    }
    
    func testEntityManager() {
        let manager = EntityManager()
        
        // Add Entity 1
        let position1 = Position(x: 0, y: 0, z: 0)
        let rotation1 = Rotation(x: 0, y: 0, z: 0)
        let newEntity1 = manager.spawn(position1, rotation1)
        
        XCTAssertEqual(newEntity1, 0)
        XCTAssertEqual(manager.archetypes.first, Archetype(with: [Position.self, Rotation.self]))
        XCTAssertEqual(manager.entities.first, Entity(archetypeId: 0, archetypeRow: 0))
        
        // Add Entity 2
        let position2 = Position(x: 0, y: 0, z: 0)
        let rotation2 = Rotation(x: 0, y: 0, z: 0)
        let newEntity2 = manager.spawn(position2, rotation2)
        
        XCTAssertEqual(newEntity2, 1)
        XCTAssertEqual(manager.archetypes.count, 1)
        XCTAssertEqual(manager.entities.count, 2)
        XCTAssertEqual(manager.entities[1], Entity(archetypeId: 0, archetypeRow: 1))
        
        // Add Entity 3
        let position3 = Position(x: 0, y: 0, z: 0)
        let newEntity3 = manager.spawn(position3)
        
        XCTAssertEqual(newEntity3, 2)
        XCTAssertEqual(manager.archetypes.count, 2)
        XCTAssertEqual(manager.entities.count, 3)
        XCTAssertEqual(manager.entities[2], Entity(archetypeId: 1, archetypeRow: 0))
        
        // Remove Entity 2
        manager.destroy(entityID: 1)
        XCTAssertEqual(manager.archetypes.count, 2)
        XCTAssertEqual(manager.entities.count, 3)
        XCTAssertNil(manager.entities[1])
    }
}
