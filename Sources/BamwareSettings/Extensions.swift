import SwiftUI

extension ColorScheme {
    var stringValue: String {
        switch self {
        case .light: return "light"
        case .dark: return "dark"
        @unknown default: return "light"
        }
    }
}

extension String {
    func toColorScheme() -> ColorScheme? {
        switch self {
        case "light": return .light
        case "dark": return .dark
        default: return nil
        }
    }
}

extension DynamicTypeSize {
    var name: String {
        switch self {
        case .xSmall: return "xSmall"
        case .small: return "small"
        case .medium: return "medium"
        case .large: return "large"
        case .xLarge: return "xLarge"
        case .xxLarge: return "xxLarge"
        case .xxxLarge: return "xxxLarge"
        case .accessibility1: return "accessibility1"
        case .accessibility2: return "accessibility2"
        case .accessibility3: return "accessibility3"
        case .accessibility4: return "accessibility4"
        case .accessibility5: return "accessibility5"
        default: return "medium"
        }
    }

    static func from(name: String) -> DynamicTypeSize? {
        switch name {
        case "xSmall": return .xSmall
        case "small": return .small
        case "medium": return .medium
        case "large": return .large
        case "xLarge": return .xLarge
        case "xxLarge": return .xxLarge
        case "xxxLarge": return .xxxLarge
        case "accessibility1": return .accessibility1
        case "accessibility2": return .accessibility2
        case "accessibility3": return .accessibility3
        case "accessibility4": return .accessibility4
        case "accessibility5": return .accessibility5
        default: return nil
        }
    }
}