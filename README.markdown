# CryptoHash

Basic Hash Functions in Swift.

The project has two halves: An Objective-C file containing a wrapper around CommonCrypto functions. This is bascially C functions that use Foundation types like `NSValue` and `NSData` over C structs and pointers.

One-shot functions are wrapped to take a Data parameter.

```
// one-shot function:
let digest = SHA1(data)
```
The method signature for the update methods is a little ugly in Swift, but just pass in the context.

Here's the function:

```
func SHA224_Update(_ context: AutoreleasingUnsafeMutablePointer<NSValue>, _ data: Data)
```

Here's the usage:

```

// Update
var context = SHA1_Init()
SHA1_Update(&context, someData)
SHA1_Update(&context, moreData)
let digest = SHA1_Final(context)

```

And so on for other hash functions.

Using an Objective-C wrapper makes it easier to make a framework without fragile module map files.

Then there is a Swift file that implements categories on `Data` and `String`.

```
let data = ...

// MD5 digest:
let digest: Data = data.MD5Digest()
let hexdigest: String = data.MD5Hexdigest()

// SHA1 digest:
let digest: Data = data.SHA1Digest()
let hexdigest: String = data.SHA1Hexdigest()

//SHA224
let digest: Data = data.SHA224Digest()
let hexdigest: String = data.SHA224Hexdigest()

// SHA256
let digest: Data = data.SHA256Digest()
let hexdigest: String = data.SHA256Hexdigest()

// SHA384
let digest: Data = data.SHA384Digest()
let hexdigest: String = data.SHA384Hexdigest()

// SHA512
let digest: Data = data.SHA512Digest()
let hexdigest: String = data.SHA512Hexdigest()

```

