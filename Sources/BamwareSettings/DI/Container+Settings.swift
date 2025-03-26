import BamwareCore
import Foundation

public extension Container {
    func registerSettings(persistence: SettingsPersistence) {
        self.register { SettingsManager(persistence: persistence) }
    }
}
