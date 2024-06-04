//
//  EngineTests.swift
//  EngineTests
//
//  Created by Geovana Contine on 04/06/24.
//

@testable import MedievalWar
import XCTest

final class EngineTests: XCTestCase {

    func testArchetype() throws {
        
        // Setup archetype
        var archetype = Archetype(componentTypes: [Position.self, Rotation.self])
        
        // Fetch components
        archetype.components(Position.self, Rotation.self) { positions, rotations in
            XCTAssertEqual(positions, [])
            XCTAssertEqual(rotations, [])
        }
        
        // Add Entity 1
        let position1 = Position(x: 0, y: 0, z: 0)
        let rotation1 = Rotation(x: 0, y: 0, z: 0)
        let entity1: [any Component] = [position1, rotation1]
        archetype.add(newComponents: entity1)
        
        // Add Entity 2
        let position2 = Position(x: 1, y: 1, z: 1)
        let rotation2 = Rotation(x: 1, y: 1, z: 1)
        let entity2: [any Component] = [position2, rotation2]
        archetype.add(newComponents: entity2)
        
        // Fetch components
        archetype.components(Position.self, Rotation.self) { positions, rotations in
            XCTAssertEqual(positions, [position1, position2])
            XCTAssertEqual(rotations, [rotation1, rotation2])
        }
        
        // Remove entity
        archetype.removeEntity(externalId: 0)
        
        // Fetch components
        archetype.components(Position.self, Rotation.self) { positions, rotations in
            XCTAssertEqual(positions, [position2])
            XCTAssertEqual(rotations, [rotation2])
        }
        
        // Add Entity 3
        let position3 = Position(x: 2, y: 2, z: 2)
        let rotation3 = Rotation(x: 2, y: 2, z: 2)
        let entity3: [any Component] = [position3, rotation3]
        archetype.add(newComponents: entity3)
        
        // Fetch components
        archetype.components(Position.self, Rotation.self) { positions, rotations in
            XCTAssertEqual(positions, [position2, position3])
            XCTAssertEqual(rotations, [rotation2, rotation3])
        }
        
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
        archetype.add(newComponents: entity4)
        
        // Check entities integrity
        let expectedEntities2 = [
            ArchetypeEntity(externalId: 0, internalId: 1),
            ArchetypeEntity(externalId: 1, internalId: 0),
            ArchetypeEntity(externalId: 2, internalId: 2)
        ]
        XCTAssertEqual(archetype.entities, expectedEntities2)
    }
}
