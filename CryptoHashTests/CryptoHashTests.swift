import XCTest
@testable import CryptoHash

class CryptoHashTests: XCTestCase {
    var data: Data!
    override func setUp() {
        super.setUp()
        self.data = "Hello World".data(using: .utf8)
    }
    
    override func tearDown() {
        self.data = nil
        super.tearDown()
    }
    
    func testSHA1() {
        let digest = self.data.SHA1()
        let expected = Data([0x0a, 0x4d, 0x55, 0xa8, 0xd7, 0x78, 0xe5, 0x02, 0x2f, 0xab,
                             0x70, 0x19, 0x77, 0xc5, 0xd8, 0x40, 0xbb, 0xc4, 0x86, 0xd0 ])
        XCTAssertEqual(digest, expected)
    }

    func testSHA1Hexstring() {
        let digest = self.data.SHA1Hexstring()
        let expected = "0a4d55a8d778e5022fab701977c5d840bbc486d0"
        XCTAssertEqual(digest, expected)
    }
    func testMD5() {
        let digest = self.data.MD5()
        let expected = Data([0xb1, 0x0a, 0x8d, 0xb1, 0x64, 0xe0, 0x75, 0x41,
                             0x05, 0xb7, 0xa9, 0x9b, 0xe7, 0x2e, 0x3f, 0xe5])
        XCTAssertEqual(digest, expected)
    }
    func testMD5Hexstring() {
        let digest = self.data.MD5Hexstring()
        let expected = "b10a8db164e0754105b7a99be72e3fe5"
        XCTAssertEqual(digest, expected)
    }
    func testSHA256() {
        let digest = self.data.SHA256()
        let expected = Data([0xa5, 0x91, 0xa6, 0xd4, 0x0b, 0xf4, 0x20, 0x40, 0x4a, 0x01,
                            0x17, 0x33, 0xcf, 0xb7, 0xb1, 0x90, 0xd6, 0x2c, 0x65, 0xbf,
                            0x0b, 0xcd, 0xa3, 0x2b, 0x57, 0xb2, 0x77, 0xd9, 0xad, 0x9f,
                            0x14, 0x6e])
        XCTAssertEqual(digest, expected)

    }
    func testSHA256Hexstring() {
        let digest = self.data.SHA256Hexstring()
        let expected  = "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e"
        XCTAssertEqual(digest, expected)
    }
    func testSHA224Hexstring() {
        let digest = self.data.SHA224Hexstring()
        let expected = "c4890faffdb0105d991a461e668e276685401b02eab1ef4372795047"
        XCTAssertEqual(digest, expected)
    }
    func testSHA384Hexstring() {
        let digest = self.data.SHA384Hexstring()
        let expected = "99514329186b2f6ae4a1329e7ee6c610a729636335174ac6b740f9028396fcc803d0e93863a7c3d90f86beee782f4f3f"
        XCTAssertEqual(digest, expected)
    }
    func testSHA512Hexstring() {
        let digest = self.data.SHA512Hexstring()
        let expected = "2c74fd17edafd80e8447b0d46741ee243b7eb74dd2149a0ab1b9246fb30382f27e853d8585719e0e67cbda0daa8f51671064615d645ae27acb15bfb1447f459b"
        XCTAssertEqual(digest, expected)
    }
}
