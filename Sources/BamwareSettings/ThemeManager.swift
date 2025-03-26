import SwiftUI

public final class ThemeManager: ObservableObject {
    @Published public var palette: ThemePalette = .light

    public func update(for scheme: ColorScheme?) {
        switch scheme {
        case .dark: palette = .dark
        case .light: palette = .light
        default: palette = .light
        }
    }
}