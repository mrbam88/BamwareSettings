import SwiftUI

public protocol SettingsProviding: ObservableObject {
    var overrideColorScheme: ColorScheme? { get set }
    var overrideTextSize: DynamicTypeSize? { get set }
    var overrideLocale: Locale? { get set }

    func toggleTheme()
    func increaseTextSize()
    func switchLocale()
}

public final class SettingsManager: SettingsProviding {
    @Published public var overrideColorScheme: ColorScheme? {
        didSet { persistence.saveColorScheme(overrideColorScheme) }
    }
    @Published public var overrideTextSize: DynamicTypeSize? {
        didSet { persistence.saveTextSize(overrideTextSize) }
    }
    @Published public var overrideLocale: Locale? {
        didSet { persistence.saveLocale(overrideLocale) }
    }

    private let persistence: SettingsPersistence

    public init(persistence: SettingsPersistence) {
        self.persistence = persistence
        self.overrideColorScheme = persistence.loadColorScheme()
        self.overrideTextSize = persistence.loadTextSize()
        self.overrideLocale = persistence.loadLocale()
    }

    public func toggleTheme() {
        let old = overrideColorScheme ?? .light
        overrideColorScheme = old == .light ? .dark : .light
    }

    public func increaseTextSize() {
        let sizes: [DynamicTypeSize] = [.xSmall, .small, .medium, .large, .xLarge, .xxLarge, .xxxLarge]
        let current = overrideTextSize ?? .medium
        let nextIndex = (sizes.firstIndex(of: current) ?? 0) + 1
        overrideTextSize = sizes[nextIndex % sizes.count]
    }

    public func switchLocale() {
        let current = overrideLocale?.identifier ?? "en_US"
        overrideLocale = Locale(identifier: current == "en_US" ? "fr_FR" : "en_US")
    }
}