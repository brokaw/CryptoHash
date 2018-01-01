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

NSValue * VSha1_Init(void)
{
    CC_SHA1_CTX *ctx = calloc(1, sizeof(CC_SHA1_CTX));
    CC_SHA1_Init(ctx);
    NSValue *value = [NSValue valueWithBytes:ctx objCType:@encode(CC_SHA1_CTX)];
    free(ctx);
    return value;
}
NSMutableData * SHA1_Init(void)
{
    CC_SHA1_CTX *ctx = calloc(1, sizeof(CC_SHA1_CTX));
    CC_SHA1_Init(ctx);
//    NSValue *value = [NSValue valueWithBytes:ctx objCType:@encode(CC_SHA1_CTX)];
    NSMutableData *data = [NSMutableData dataWithBytesNoCopy:ctx length:sizeof(CC_SHA1_CTX) freeWhenDone:YES];
    return data;
}
void SHA1_Update(NSMutableData *context, NSData *data)
{
    size_t contextSize = sizeof(CC_SHA1_CTX);
    CC_SHA1_CTX ctx = {};
    [context getBytes:&ctx length:contextSize];
//    [context getValue:ctx size:contextSize];
    CC_SHA1_Update(&ctx, data.bytes, data.length);
    NSData *newContext = [NSData dataWithBytesNoCopy:&ctx length:contextSize freeWhenDone:NO];
    [context setData:newContext];
}

void VSha1_update(NSValue **value, NSData *data)
{
    size_t contextSize = sizeof(CC_SHA1_CTX);
    CC_SHA1_CTX ctx = {};
    [*value getValue:&ctx size:contextSize];
    CC_SHA1_Update(&ctx, data.bytes, data.length);
    NSValue *newContext = [NSValue valueWithBytes:&ctx objCType:@encode(CC_SHA1_CTX)];
    *value = newContext;
}
NSData * VSha1_final(NSValue * value)
{
    size_t contextSize = sizeof(CC_SHA1_CTX);
    CC_SHA1_CTX ctx = {};
    [value getValue:&ctx size:contextSize];
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &ctx);
    return [[NSData alloc] initWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}
NSData * SHA1_Final(NSMutableData *context)
{
    size_t contextSize = sizeof(CC_SHA1_CTX);
    CC_SHA1_CTX *ctx = calloc(1, contextSize);
    [context getBytes:ctx length:contextSize];
//    [context getValue:ctx size:contextSize];
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, ctx);
    return [[NSData alloc] initWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

@interface SHA1Digest() {
    CC_SHA1_CTX *_context;
}
@end

@implementation SHA1Digest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _context = calloc(1, sizeof(CC_SHA1_CTX));
        CC_SHA1_Init(_context);
    }
    return self;
}

- (void)dealloc
{
    free(_context);
}

- (void)update:(NSData *)data
{
    CC_SHA1_Update(_context, data.bytes, (CC_LONG)data.length);
}

- (NSData *)digest
{
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, _context);
    return [NSData dataWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (void)reset
{
    free(_context);
    _context = calloc(1, sizeof(CC_SHA1_CTX));
    CC_SHA1_Init(_context);
}
@end

