import SwiftUI
import GRDB

struct UserConfig: Codable, FetchableRecord, PersistableRecord {
    var id: String = "singleton"
    var colorScheme: String?
    var textSize: String?
    var locale: String?

    static let databaseTableName = "userConfig"
}

final class GRDBPersistence: SettingsPersistence {
    let dbQueue: DatabaseQueue

    init(dbQueue: DatabaseQueue) {
        self.dbQueue = dbQueue
        try? dbQueue.write { db in
            try db.create(table: "userConfig", ifNotExists: true) { t in
                t.column("id", .text).primaryKey()
                t.column("colorScheme", .text)
                t.column("textSize", .text)
                t.column("locale", .text)
            }
            if try UserConfig.fetchOne(db, key: "singleton") == nil {
                try UserConfig().save(db)
            }
        }
    }

    func saveColorScheme(_ scheme: ColorScheme?) {
        try? dbQueue.write { db in
            var config = try UserConfig.fetchOne(db, key: "singleton") ?? UserConfig()
            config.colorScheme = scheme?.stringValue
            try config.save(db)
        }
    }

    func saveTextSize(_ size: DynamicTypeSize?) {
        try? dbQueue.write { db in
            var config = try UserConfig.fetchOne(db, key: "singleton") ?? UserConfig()
            config.textSize = size?.name
            try config.save(db)
        }
    }

    func saveLocale(_ locale: Locale?) {
        try? dbQueue.write { db in
            var config = try UserConfig.fetchOne(db, key: "singleton") ?? UserConfig()
            config.locale = locale?.identifier
            try config.save(db)
        }
    }

    func loadColorScheme() -> ColorScheme? {
        try? dbQueue.read { db in
            try UserConfig.fetchOne(db, key: "singleton")?.colorScheme?.toColorScheme()
        }
    }

    func loadTextSize() -> DynamicTypeSize? {
        try? dbQueue.read { db in
            guard let name = try UserConfig.fetchOne(db, key: "singleton")?.textSize else { return nil }
            return DynamicTypeSize.from(name: name)
        }
    }

    func loadLocale() -> Locale? {
        try? dbQueue.read { db in
            try UserConfig.fetchOne(db, key: "singleton")?.locale.map(Locale.init(identifier:))
        }
    }
}