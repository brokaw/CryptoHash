#include "CommonCryptoBridge.h"
#include <CommonCrypto/CommonCrypto.h>

typedef unsigned char * (*HashFunc)(const void *, CC_LONG, unsigned char *);

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

//int SHA256_Init(CC_SHA256_CTX *context) {
//    return CC_SHA256_Init(context);
//}
//int SHA256_update(CC_SHA256_CTX *context, NSData *data) {
//    return CC_SHA256_Update(context, data.bytes, (CC_LONG)data.length);
//}
//int SHA256_Final(unsigned char *md, CC_SHA256_CTX *context) {
//    return CC_SHA256_Final(md, context);
//}

