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
    
    func testSHA1Digest() {
        let digest = self.data.SHA1Digest()
        let expected = Data([0x0a, 0x4d, 0x55, 0xa8, 0xd7, 0x78, 0xe5, 0x02, 0x2f, 0xab,
                             0x70, 0x19, 0x77, 0xc5, 0xd8, 0x40, 0xbb, 0xc4, 0x86, 0xd0 ])
        XCTAssertEqual(digest, expected)
    }

    func testSHA1Hexdigest() {
        let digest = self.data.SHA1Hexdigest()
        let expected = "0a4d55a8d778e5022fab701977c5d840bbc486d0"
        XCTAssertEqual(digest, expected)
    }
    func testMD5Digest() {
        let digest = self.data.MD5Digest()
        let expected = Data([0xb1, 0x0a, 0x8d, 0xb1, 0x64, 0xe0, 0x75, 0x41,
                             0x05, 0xb7, 0xa9, 0x9b, 0xe7, 0x2e, 0x3f, 0xe5])
        XCTAssertEqual(digest, expected)
    }
    func testMD5Hexdigest() {
        let digest = self.data.MD5Hexdigest()
        let expected = "b10a8db164e0754105b7a99be72e3fe5"
        XCTAssertEqual(digest, expected)
    }
    func testSHA256Digest() {
        let digest = self.data.SHA256Digest()
        let expected = Data([0xa5, 0x91, 0xa6, 0xd4, 0x0b, 0xf4, 0x20, 0x40, 0x4a, 0x01,
                            0x17, 0x33, 0xcf, 0xb7, 0xb1, 0x90, 0xd6, 0x2c, 0x65, 0xbf,
                            0x0b, 0xcd, 0xa3, 0x2b, 0x57, 0xb2, 0x77, 0xd9, 0xad, 0x9f,
                            0x14, 0x6e])
        XCTAssertEqual(digest, expected)

    }
    func testSHA256Hexdigest() {
        let digest = self.data.SHA256Hexdigest()
        let expected  = "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e"
        XCTAssertEqual(digest, expected)
    }
    func testSHA224Digest() {
        let digest = self.data.SHA224Digest()
        let expected = Data([0xc4, 0x89, 0x0f, 0xaf, 0xfd, 0xb0, 0x10, 0x5d, 0x99, 0x1a,
                             0x46, 0x1e, 0x66, 0x8e, 0x27, 0x66, 0x85, 0x40, 0x1b, 0x02,
                             0xea, 0xb1, 0xef, 0x43, 0x72, 0x79, 0x50, 0x47])
        XCTAssertEqual(digest, expected)
    }
    func testSHA224Hexdigest() {
        let digest = self.data.SHA224Hexdigest()
        let expected = "c4890faffdb0105d991a461e668e276685401b02eab1ef4372795047"
        XCTAssertEqual(digest, expected)
    }
    func testSHA384Digest() {
        let digest = self.data.SHA384Digest()
        let expected = Data([0x99, 0x51, 0x43, 0x29, 0x18, 0x6b, 0x2f, 0x6a, 0xe4, 0xa1,
                             0x32, 0x9e, 0x7e, 0xe6, 0xc6, 0x10, 0xa7, 0x29, 0x63, 0x63,
                             0x35, 0x17, 0x4a, 0xc6, 0xb7, 0x40, 0xf9, 0x02, 0x83, 0x96,
                             0xfc, 0xc8, 0x03, 0xd0, 0xe9, 0x38, 0x63, 0xa7, 0xc3, 0xd9,
                             0x0f, 0x86, 0xbe, 0xee, 0x78, 0x2f, 0x4f, 0x3f])
        XCTAssertEqual(digest, expected)
    }
    func testSHA384Hexdigest() {
        let digest = self.data.SHA384Hexdigest()
        let expected = "99514329186b2f6ae4a1329e7ee6c610a729636335174ac6b740f9028396fcc803d0e93863a7c3d90f86beee782f4f3f"
        XCTAssertEqual(digest, expected)
    }
    func testSHA512Digest() {
        let digest = self.data.SHA512Digest()
        let expected = Data([0x2c, 0x74, 0xfd, 0x17, 0xed, 0xaf, 0xd8, 0x0e, 0x84, 0x47,
                             0xb0, 0xd4, 0x67, 0x41, 0xee, 0x24, 0x3b, 0x7e, 0xb7, 0x4d,
                             0xd2, 0x14, 0x9a, 0x0a, 0xb1, 0xb9, 0x24, 0x6f, 0xb3, 0x03,
                             0x82, 0xf2, 0x7e, 0x85, 0x3d, 0x85, 0x85, 0x71, 0x9e, 0x0e,
                             0x67, 0xcb, 0xda, 0x0d, 0xaa, 0x8f, 0x51, 0x67, 0x10, 0x64,
                             0x61, 0x5d, 0x64, 0x5a, 0xe2, 0x7a, 0xcb, 0x15, 0xbf, 0xb1,
                             0x44, 0x7f, 0x45, 0x9b])
        XCTAssertEqual(digest, expected)
    }
    func testSHA512Hexdigest() {
        let digest = self.data.SHA512Hexdigest()
        let expected = "2c74fd17edafd80e8447b0d46741ee243b7eb74dd2149a0ab1b9246fb30382f27e853d8585719e0e67cbda0daa8f51671064615d645ae27acb15bfb1447f459b"
        XCTAssertEqual(digest, expected)
    }
}
