#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSData * MD5(NSData * data);
NSData * SHA1(NSData * data);
NSData * SHA224(NSData * data);
NSData * SHA256(NSData * data);
NSData * SHA384(NSData * data);
NSData * SHA512(NSData * data);

//int SHA256_Init(CC_SHA256_CTX *context);
//int SHA256_update(CC_SHA256_CTX *context, NSData *data);
//int SHA256_Final(unsigned char *md, CC_SHA256_CTX *context);

NS_ASSUME_NONNULL_END
