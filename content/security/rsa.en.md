---
title: "RSA"
aux: "RSA algorithm (Rivest-Shamir-Adleman) is a basis of cryptosystem that ensures the encryption with an open key 
and is widely used for the protection of sensitive data, especially when it is sent via unsecured network, such as the Internet."
---

Open key cryptography, also known as asymmetric cryptography, uses two different, but mathematically related keys, 
one public key and one private key. The public key can be shared with everyone, whereas the private key must be kept secret.

In RSA cryptography, both the public and private keys can encrypt a message. The key opposite  of the one used to 
encrypt the message is used to decrypt it. This attribute is one of the reasons RSA has become the most widely 
used asymmetric algorithm: it provides confidentiality, integrity, and authenticity of electronic communications and 
data storage.

Many protocols, including SSH, OpenPGP, S/MIME, and SSL/TLS, rely on RSA for encryption and digital signature. 
It is also used in software, browsers are an obvious example, as they need to establish a secure connection via an 
insecure network such as the Internet.

## RSA implementation
Wault uses RSA with a 4096-bit key in OAEP mode[^1]. When registering a new user, Wault generates an RSA key pair 
using a cryptographic random number generator. When creating a workspace, the key of [block]({{< relref "/security/aes" >}}) 
encryption is generated that will be used for the encryption of all the data in the workspace. The block key itself is 
encrypted with the user's public key. This approach allows one user to create lots of workspaces and to share access 
to his workspaces to other users signed up with Wault.

[^1]: [Optimal asymmetric encryption padding](https://en.wikipedia.org/wiki/Optimal_asymmetric_encryption_padding)
