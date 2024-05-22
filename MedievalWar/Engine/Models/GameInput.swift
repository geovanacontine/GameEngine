import Foundation

protocol GameInput {
    
    // Buttons
    var xAxis: Double { get set } // -1 ... 1
    var yAxis: Double { get set } // -1 ... 1
}
