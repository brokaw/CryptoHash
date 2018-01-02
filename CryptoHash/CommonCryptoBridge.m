#include "CommonCryptoBridge.h"
#include <CommonCrypto/CommonCrypto.h>

typedef unsigned char * (* HashFunc)(const void *, CC_LONG, unsigned char *);

NSData * _Nonnull hash(NSData *data, int length, HashFunc func) {
    unsigned char buffer[length];
    unsigned char *digest = func(data.bytes, (CC_LONG)data.length, buffer);
    return [NSData dataWithBytes:digest length:length];
}

NSData * _Nonnull MD5(NSData * _Nonnull data)
{
    return hash(data, CC_MD5_DIGEST_LENGTH, CC_MD5);
}

NSData * _Nonnull SHA1(NSData * _Nonnull data)
{
    return hash(data, CC_SHA1_DIGEST_LENGTH, CC_SHA1);
}

NSData * _Nonnull SHA224(NSData * _Nonnull data)
{
    return hash(data, CC_SHA224_DIGEST_LENGTH, CC_SHA224);
}

NSData * _Nonnull SHA256(NSData * _Nonnull data)
{
    return hash(data, CC_SHA256_DIGEST_LENGTH, CC_SHA256);
}

NSData * _Nonnull SHA384(NSData * _Nonnull data)
{
    return hash(data, CC_SHA384_DIGEST_LENGTH, CC_SHA384);
}

NSData * _Nonnull SHA512(NSData * _Nonnull data)
{
    return hash(data, CC_SHA512_DIGEST_LENGTH, CC_SHA512);
}

NSValue * MD5_Init(void)
{
    CC_MD5_CTX ctx = {};
    CC_MD5_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_MD5_CTX)];
}

void MD5_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data)
{
    CC_MD5_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_MD5_CTX)];
    CC_MD5_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_MD5_CTX)];
}

NSData * MD5_Final(NSValue * context)
{
    CC_MD5_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_MD5_CTX)];
    unsigned char md[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(md, &ctx);
    return [NSData dataWithBytes:md length:CC_MD5_DIGEST_LENGTH];
}

NSValue * SHA1_Init(void)
{
    CC_SHA1_CTX ctx = {};
    CC_SHA1_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA1_CTX)];
}

void SHA1_Update(NSValue **context, NSData *data)
{
    CC_SHA1_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_SHA1_CTX)];
    CC_SHA1_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA1_CTX)];;
}

NSData * SHA1_Final(NSValue * context)
{
    CC_SHA1_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_SHA1_CTX)];
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &ctx);
    return [NSData dataWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

NSValue * SHA224_Init(void)
{
    CC_SHA256_CTX ctx = {};
    CC_SHA224_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA256_CTX)];
}

void SHA224_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data)
{
    CC_SHA256_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_SHA256_CTX)];
    CC_SHA224_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA256_CTX)];
}

NSData * SHA224_Final(NSValue * context)
{
    CC_SHA256_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_SHA256_CTX)];
    unsigned char md[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224_Final(md, &ctx);
    return [NSData dataWithBytes:md length:CC_SHA224_DIGEST_LENGTH];
}

NSValue * SHA256_Init(void)
{
    CC_SHA256_CTX ctx = {};
    CC_SHA256_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA256_CTX)];
}

void SHA256_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data)
{
    CC_SHA256_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_SHA256_CTX)];
    CC_SHA256_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA256_CTX)];
}

NSData * SHA256_Final(NSValue * context)
{
    CC_SHA256_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_SHA256_CTX)];
    unsigned char md[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(md, &ctx);
    return [NSData dataWithBytes:md length:CC_SHA256_DIGEST_LENGTH];
}

NSValue * SHA384_Init(void)
{
    CC_SHA512_CTX ctx = {};
    CC_SHA384_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA512_CTX)];
}
void SHA384_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data)
{
    CC_SHA512_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_SHA512_CTX)];
    CC_SHA384_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA512_CTX)];
}
NSData * SHA384_Final(NSValue * context)
{
    CC_SHA512_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_SHA512_CTX)];
    unsigned char md[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384_Final(md, &ctx);
    return [NSData dataWithBytes:md length:CC_SHA384_DIGEST_LENGTH];
}

NSValue * SHA512_Init(void)
{
    CC_SHA512_CTX ctx = {};
    CC_SHA512_Init(&ctx);
    return [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA512_CTX)];
}
void SHA512_Update(NSValue * _Nonnull __autoreleasing * _Nonnull context, NSData *data)
{
    CC_SHA512_CTX ctx = {};
    [*context getValue:&ctx size:sizeof(CC_SHA512_CTX)];
    CC_SHA512_Update(&ctx, data.bytes, (CC_LONG)data.length);
    *context = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA512_CTX)];
}
NSData * SHA512_Final(NSValue * context)
{
    CC_SHA512_CTX ctx = {};
    [context getValue:&ctx size:sizeof(CC_SHA512_CTX)];
    unsigned char md[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(md, &ctx);
    return [NSData dataWithBytes:md length:CC_SHA512_DIGEST_LENGTH];
}

