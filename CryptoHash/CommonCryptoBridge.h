#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSData * MD5(NSData * data);
NSData * SHA1(NSData * data);
NSData * SHA224(NSData * data);
NSData * SHA256(NSData * data);
NSData * SHA384(NSData * data);
NSData * SHA512(NSData * data);

NSMutableData * SHA1_Init(void);
void SHA1_Update(NSMutableData *, NSData *);
NSData * SHA1_Final(NSMutableData *);

NSValue * VSha1_Init(void);
void VSha1_update(NSValue **value, NSData *data);
NSData * VSha1_final(NSValue * value);

@protocol CryptoHashable
- (void)update:(NSData *)data;
- (NSData *)digest;
- (void)reset;
@end

//@interface Digest: NSObject {
//    void * _context;
//}
//
//+ (void *)createContext;
//+ (void *)hashInitFunc;
//- (void *)hashUpdateFunc;
//- (void *)hashFinalFunc;
//
//@end

@interface SHA1Digest: NSObject <CryptoHashable>
@end

@interface SHA224Digest: NSObject <CryptoHashable>
@end

@interface SHA256Digest: NSObject <CryptoHashable>
@end

@interface SHA384Digest: NSObject <CryptoHashable>
@end

@interface SHA512Digest: NSObject <CryptoHashable>
@end


NS_ASSUME_NONNULL_END
