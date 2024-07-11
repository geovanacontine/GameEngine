import Foundation

struct Outline: Component {
    var color: ColorProperty
    var width: Float
}

struct ColorProperty {
    var r: Float
    var g: Float
    var b: Float
    var a: Float
}
