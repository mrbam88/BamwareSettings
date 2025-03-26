import Foundation
import GRDB

public struct UserConfig: Codable, FetchableRecord, PersistableRecord {
    public var id: String = "singleton"
    public var colorScheme: String?
    public var textSize: String?
    public var locale: String?

    public static let databaseTableName = "userConfig"

    public init(id: String = "singleton", colorScheme: String? = nil, textSize: String? = nil, locale: String? = nil) {
        self.id = id
        self.colorScheme = colorScheme
        self.textSize = textSize
        self.locale = locale
    }
}