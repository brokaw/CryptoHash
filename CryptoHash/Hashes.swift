import Foundation

public extension Data {
    public func MD5Digest() -> Data {
        return MD5(self)
    }
    public func MD5Hexdigest() -> String {
        return MD5Digest().hexstring()
    }
    public func SHA1Digest() -> Data {
        return SHA1(self)
    }
    public func SHA1Hexdigest() -> String {
        return SHA1Digest().hexstring()
    }
    public func SHA224Digest() -> Data {
        return SHA224(self)
    }
    public func SHA224Hexdigest() -> String {
        return SHA224Digest().hexstring()
    }
    public func SHA256Digest() -> Data {
        return SHA256(self)
    }
    public func SHA256Hexdigest() -> String {
        return SHA256Digest().hexstring()
    }
    public func SHA384Digest() -> Data {
        return SHA384(self)
    }
    public func SHA384Hexdigest() -> String {
        return SHA384Digest().hexstring()
    }
    public func SHA512Digest() -> Data {
        return SHA512(self)
    }
    public func SHA512Hexdigest() -> String {
        return SHA512Digest().hexstring()
    }
}

extension Data {
    func hexstring() -> String {
        return map {
            String(format: "%02x", $0)
        }.joined()
    }
}

let ENCODING = String.Encoding.utf8

public extension String {
    public func MD5Digest() -> Data? {
        return data(using: ENCODING)?.MD5Digest()
    }
    public func MD5Hexdigest() -> String? {
        return data(using: ENCODING)?.MD5Hexdigest()
    }
    public func SHA1Digest() -> Data? {
        return data(using: ENCODING)?.SHA1Digest()
    }
    public func SHA1Hexdigest() -> String? {
        return data(using: ENCODING)?.SHA1Hexdigest()
    }
    public func SHA224Digest() -> Data? {
        return data(using: ENCODING)?.SHA224Digest()
    }
    public func SHA224Hexdigest() -> String? {
        return data(using: ENCODING)?.SHA224Hexdigest()
    }
    public func SHA256Digest() -> Data? {
        return data(using: ENCODING)?.SHA256Digest()
    }
    public func SHA256Hexdigest() -> String? {
        return data(using: ENCODING)?.SHA256Hexdigest()
    }
    public func SHA384Digest() -> Data? {
        return data(using: ENCODING)?.SHA384Digest()
    }
    public func SHA384Hexdigest() -> String? {
        return data(using: ENCODING)?.SHA384Hexdigest()
    }
    public func SHA512Digest() -> Data? {
        return data(using: ENCODING)?.SHA512Digest()
    }
    public func SHA512Hexdigest() -> String? {
        return data(using: ENCODING)?.SHA512Hexdigest()
    }
}
