//
//  CryptoHashTests.swift
//  CryptoHashTests
//
//  Created by Steve Brokaw on 12/19/17.
//  Copyright © 2017 techmecanique. All rights reserved.
//

import XCTest
@testable import CryptoHash

class CryptoHashTests: XCTestCase {
    var data: Data!
    override func setUp() {
        super.setUp()
        self.data = "Hello World".data(using: .utf8)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSHA1() {
        let digest = self.data.SHA1()
        let expected = Data([0x0a, 0x4d, 0x55, 0xa8, 0xd7, 0x78, 0xe5, 0x02, 0x2f, 0xab,
                             0x70, 0x19, 0x77, 0xc5, 0xd8, 0x40, 0xbb, 0xc4, 0x86, 0xd0 ])
        XCTAssertEqual(digest, expected)
    }

    func testMD5() {
        let digest = self.data.MD5()
        let expected = Data([0xb1, 0x0a, 0x8d, 0xb1, 0x64, 0xe0, 0x75, 0x41,
                             0x05, 0xb7, 0xa9, 0x9b, 0xe7, 0x2e, 0x3f, 0xe5])
        XCTAssertEqual(digest, expected)
    }

    func testSHA256() {
        let digest = self.data.SHA256()
        let expected = Data([0xa5, 0x91, 0xa6, 0xd4, 0x0b, 0xf4, 0x20, 0x40, 0x4a, 0x01, 0x17, 0x33, 0xcf, 0xb7, 0xb1, 0x90, 0xd6, 0x2c, 0x65, 0xbf, 0x0b, 0xcd, 0xa3, 0x2b, 0x57, 0xb2, 0x77, 0xd9, 0xad, 0x9f, 0x14, 0x6e])
        XCTAssertEqual(digest, expected)

    }
    
}
