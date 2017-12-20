import Foundation
import CommonCrypto

public extension Data {
    typealias  CCHashFunc = (UnsafeRawPointer?, CC_LONG, UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>!

    func hash(length: Int32, function: CCHashFunc) -> Data {
        return self.withUnsafeBytes({ (pointer: UnsafePointer<UInt8>) -> Data in
            var buffer = [UInt8](repeating: 0, count: Int(length))
            let length = CC_LONG(self.count)
            let _ = function(pointer, length, &buffer)
            return Data(bytes: buffer)
        })
    }
    public func MD5Digest() -> Data {
        return hash(length: CC_MD5_DIGEST_LENGTH, function: CC_MD5)
    }
    public func MD5Hexdigest() -> String {
        return self.MD5Digest().hexstring()
    }
    public func SHA1Digest() -> Data {
        return hash(length: CC_SHA1_DIGEST_LENGTH, function: CC_SHA1)
    }
    public func SHA1Hexdigest() -> String {
        return self.SHA1Digest().hexstring()
    }
    public func SHA256Digest() -> Data {
        return hash(length: CC_SHA256_DIGEST_LENGTH, function: CC_SHA256)
    }
    public func SHA256Hexdigest() -> String {
        return self.SHA256Digest().hexstring()
    }
    public func SHA224Digest() -> Data {
        return hash(length: CC_SHA224_DIGEST_LENGTH, function: CC_SHA224)
    }
    public func SHA224Hexdigest() -> String {
        return self.SHA224Digest().hexstring()
    }
    public func SHA384Digest() -> Data {
        return hash(length: CC_SHA384_DIGEST_LENGTH, function: CC_SHA384)
    }
    public func SHA384Hexdigest() -> String {
        return self.SHA384Digest().hexstring()
    }
    public func SHA512Digest() -> Data {
        return hash(length: CC_SHA512_DIGEST_LENGTH, function: CC_SHA512)
    }
    public func SHA512Hexdigest() -> String {
        return self.SHA512Digest().hexstring()
    }
}

extension Data {
    func hexstring() -> String {
        return self.map {
            String(format: "%02x", $0)
        }.joined()
    }
}

let ENCODING = String.Encoding.utf8

// TODO: No string methods are tested
public extension String {
    public func MD5Digest() -> Data? {
        return self.data(using: ENCODING)?.MD5Digest()
    }
    public func MD5Hexdigest() -> String? {
        return self.data(using: ENCODING)?.MD5Hexdigest()
    }
    public func SHA1Digest() -> Data? {
        return self.data(using: ENCODING)?.SHA1Digest()
    }
    public func SHA1Hexdigest() -> String? {
        return self.data(using: ENCODING)?.SHA1Hexdigest()
    }
    public func SHA224Digest() -> Data? {
        return self.data(using: ENCODING)?.SHA224Digest()
    }
    public func SHA224Hexdigest() -> String? {
        return self.data(using: ENCODING)?.SHA224Hexdigest()
    }
    public func SHA256Digest() -> Data? {
        return self.data(using: ENCODING)?.SHA256Digest()
    }
    public func SHA256Hexdigest() -> String? {
        return self.data(using: ENCODING)?.SHA256Hexdigest()
    }
    public func SHA384Digest() -> Data? {
        return self.data(using: ENCODING)?.SHA384Digest()
    }
    public func SHA384Hexdigest() -> String? {
        return self.data(using: ENCODING)?.SHA384Hexdigest()
    }
    func SHA512Digest() -> Data? {
        return self.data(using: ENCODING)?.SHA512Digest()
    }
    func SHA512Hexdigest() -> String? {
        return self.data(using: ENCODING)?.SHA512Hexdigest()
    }
}

