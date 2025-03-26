import SwiftUI

protocol SettingsProviding: ObservableObject {
    var overrideColorScheme: ColorScheme? { get set }
    var overrideTextSize: DynamicTypeSize? { get set }
    var overrideLocale: Locale? { get set }

    func toggleTheme()
    func increaseTextSize()
    func switchLocale()
}

final class SettingsManager: SettingsProviding {
    @Published var overrideColorScheme: ColorScheme? {
        didSet { persistence.saveColorScheme(overrideColorScheme) }
    }
    @Published var overrideTextSize: DynamicTypeSize? {
        didSet { persistence.saveTextSize(overrideTextSize) }
    }
    @Published var overrideLocale: Locale? {
        didSet { persistence.saveLocale(overrideLocale) }
    }

    private let persistence: SettingsPersistence

    init(persistence: SettingsPersistence) {
        self.persistence = persistence
        self.overrideColorScheme = persistence.loadColorScheme()
        self.overrideTextSize = persistence.loadTextSize()
        self.overrideLocale = persistence.loadLocale()
    }

    func toggleTheme() {
        let old = overrideColorScheme ?? .light
        overrideColorScheme = old == .light ? .dark : .light
    }

    func increaseTextSize() {
        let sizes: [DynamicTypeSize] = [.xSmall, .small, .medium, .large, .xLarge, .xxLarge, .xxxLarge]
        let current = overrideTextSize ?? .medium
        let nextIndex = (sizes.firstIndex(of: current) ?? 0) + 1
        overrideTextSize = sizes[nextIndex % sizes.count]
    }

    func switchLocale() {
        let current = overrideLocale?.identifier ?? "en_US"
        overrideLocale = Locale(identifier: current == "en_US" ? "fr_FR" : "en_US")
    }
}