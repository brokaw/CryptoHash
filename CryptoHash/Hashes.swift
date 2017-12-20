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
    public func MD5() -> Data {
        return hash(length: CC_MD5_DIGEST_LENGTH, function: CC_MD5)
    }
    public func MD5Hexstring() -> String {
        return self.MD5().hexstring()
    }
    public func SHA1() -> Data {
        return hash(length: CC_SHA1_DIGEST_LENGTH, function: CC_SHA1)
    }
    public func SHA1Hexstring() -> String {
        return self.SHA1().hexstring()
    }
    public func SHA256() -> Data {
        return hash(length: CC_SHA256_DIGEST_LENGTH, function: CC_SHA256)
    }
    public func SHA256Hexstring() -> String {
        return self.SHA256().hexstring()
    }
}

extension Data {
    func hexstring() -> String {
        return map {
            String(format: "%02x", $0)
        }.joined()
    }
}

