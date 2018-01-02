#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSData * MD5(NSData * data);
NSData * SHA1(NSData * data);
NSData * SHA224(NSData * data);
NSData * SHA256(NSData * data);
NSData * SHA384(NSData * data);
NSData * SHA512(NSData * data);

NSValue * MD5_Init(void);
void MD5_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * MD5_Final(NSValue * value);

NSValue * SHA1_Init(void);
void SHA1_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * SHA1_Final(NSValue * value);

NSValue * SHA224_Init(void);
void SHA224_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * SHA224_Final(NSValue * value);

NSValue * SHA256_Init(void);
void SHA256_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * SHA256_Final(NSValue *);

NSValue * SHA384_Init(void);
void SHA384_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * SHA384_Final(NSValue *);

NSValue * SHA512_Init(void);
void SHA512_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data);
NSData * SHA512_Final(NSValue *);

NS_ASSUME_NONNULL_END
