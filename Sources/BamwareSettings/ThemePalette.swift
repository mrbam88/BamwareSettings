import SwiftUI

public struct ThemePalette {
    public var primary: Color
    public var secondary: Color
    public var background: Color
    public var text: Color

    public static let light = ThemePalette(
        primary: .blue,
        secondary: .green,
        background: .white,
        text: .black
    )

    public static let dark = ThemePalette(
        primary: .purple,
        secondary: .orange,
        background: .black,
        text: .white
    )
}