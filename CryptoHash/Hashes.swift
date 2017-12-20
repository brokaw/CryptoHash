//
//  Hashed.swift
//  CryptoHash
//
//  Created by Steve Brokaw on 12/19/17.
//  Copyright © 2017 Steve Brokaw. All rights reserved.
//

import Foundation
import CommonCrypto
/*
 unsigned int outputLength = CC_SHA256_DIGEST_LENGTH;
 unsigned char output[outputLength];

 CC_SHA256(self.bytes, (unsigned int) self.length, output);
 return [NSMutableData dataWithBytes:output length:outputLength];

 */

extension Data {
    func MD5() -> Data {
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        var buffer = [UInt8](repeating: 0, count: digestLen)
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let length = CC_LONG(self.count)
            let _ = CC_MD5(pointer, length, &buffer)
            return Data(bytes: buffer)
        }
    }
    func SHA1() -> Data {
        let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
        var buffer = [UInt8](repeating: 0, count: digestLen)
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let length = CC_LONG(self.count)
            let _ = CC_SHA1(pointer, length, &buffer)
            return Data(bytes: buffer)
        }
    }
    func SHA256() -> Data {
        let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
        var buffer = [UInt8](repeating: 0, count: digestLen)
        return self.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Data in
            let length = CC_LONG(self.count)
            let _ = CC_SHA256(pointer, length, &buffer)
            return Data(bytes: buffer)
        }
    }
}
