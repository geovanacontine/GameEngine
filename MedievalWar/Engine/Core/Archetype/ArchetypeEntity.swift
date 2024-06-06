import Foundation

struct ArchetypeEntity: Equatable {
    let externalId: Int
    var internalId: Int?
}

extension ArchetypeEntity {
    var isDead: Bool { internalId == nil }
}
