import Foundation
import CommonCrypto

public extension Data {
    public func MD5() -> Data {
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let digestLen = Int(CC_MD5_DIGEST_LENGTH)
            var buffer = [UInt8](repeating: 0, count: digestLen)
            let dataLen = CC_LONG(self.count)
            let _ = CC_MD5(pointer, dataLen, &buffer)
            return Data(bytes: buffer)
        }
    }
    public func MD5Hexstring() -> String {
        return self.MD5().hexstring()
    }
    public func SHA1() -> Data {
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
            var buffer = [UInt8](repeating: 0, count: digestLen)
            let dataLen = CC_LONG(self.count)
            let _ = CC_SHA1(pointer, dataLen, &buffer)
            return Data(bytes: buffer)
        }
    }
    public func SHA1Hexstring() -> String {
        return self.SHA1().hexstring()
    }
    public func SHA256() -> Data {
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
            var buffer = [UInt8](repeating: 0, count: digestLen)
            let dataLen = CC_LONG(self.count)
            let _ = CC_SHA256(pointer, dataLen, &buffer)
            return Data(bytes: buffer)
        }
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
