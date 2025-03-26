import SwiftUI

public protocol SettingsPersistence {
    func saveColorScheme(_ scheme: ColorScheme?)
    func saveTextSize(_ size: DynamicTypeSize?)
    func saveLocale(_ locale: Locale?)
    func loadColorScheme() -> ColorScheme?
    func loadTextSize() -> DynamicTypeSize?
    func loadLocale() -> Locale?
}