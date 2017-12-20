# CryptoHash

Basic Hash Functions in Swift.


Usage:

Public API is implemented as extension methods on `Data`

```
// MD5 digest:
let data = ...
let digest: Data = data.MD5()
let hexdigest: String = data.MD5Hexdigest()

// SHA1 digest:
let data = ...
let digest: Data = data.SHA1()
let hexdigest: String = data.SHA1Hexdigest()

// SHA256 digest:
let data = ...
let digest: Data = data.SHA256()
let hexdigest: String = data.SHA256Hexdigest()
```
