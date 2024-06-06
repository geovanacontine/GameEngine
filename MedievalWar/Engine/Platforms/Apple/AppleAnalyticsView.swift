import SwiftUI

struct AppleAnalyticsView: View {
    
    let data: AppleAnalyticsData
    
    var body: some View {
        List {
            
            Text("Analytics")
                .bold()
            
            Section("Entities") {
                HStack {
                    Text("Archetypes")
                    Spacer()
                    Text("\(data.archetypes)")
                }
                
                HStack {
                    Text("Alive Entities")
                    Spacer()
                    Text("\(data.aliveEntities)")
                }
                
                HStack {
                    Text("Dead Entities")
                    Spacer()
                    Text("\(data.deadEntities)")
                }
            }
            
            Section("Systems") {
                ForEach(systemsPerformance, id: \.name) { system in
                    HStack {
                        Text(system.name)
                        Spacer()
                        Text(system.value + "%")
                    }
                }
            }
        }
        .frame(maxWidth: 200)
        .scrollContentBackground(.hidden)
        .background(.ultraThickMaterial)
        .padding()
    }
    
    var systemsPerformance: [(name: String, value: String)] {
        data.systems.sorted(by: { $0.value > $1.value }).map { systemPerformance in
            let value = systemPerformance.value * 100
            let valueString = String(format: "%.2f", value)
            return (systemPerformance.key, valueString)
        }
    }
}
