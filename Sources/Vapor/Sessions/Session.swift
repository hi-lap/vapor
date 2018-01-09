/// Something that is convertible between a Cookie and an instance.
public final class Session {
    /// The cookie value
    public var cookie: Cookie.Value?

    /// This session's data
    public var data: SessionData

    /// Create a new session.
    public init() {
        cookie = nil
        data = .init()
    }
}

/// Codable session data.
public struct SessionData: Codable {
    /// Session codable object storage.
    public var storage: [String: Codable]

    /// Create a new, empty session data.
    public init() {
        storage = [:]
    }

    /// See Decodable.init
    public init(from decoder: Decoder) throws {
        storage = try [String: Codable].init(from: decoder)
    }

    /// See Encodable.encode
    public func encode(to encoder: Encoder) throws {
        try storage.encode(to: encoder)
    }
}

extension Session {
    /// Convenience [String: String] accessor.
    public subscript(_ key: String) -> String? {
        get {
            return data.storage[key] as? String
        }
        set {
            data.storage[key] = newValue
        }
    }
}