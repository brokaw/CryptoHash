# CryptoHash

Basic Hash Functions in Swift.


Usage:

Public API is implemented as extension methods on `Data`

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
