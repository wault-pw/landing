---
title: "AES"
hero: "img/dots.png"
aux: "Advanced Encryption Standard (AES) — is a block code adopted as an encryption standard by the U.S. government. 
AES was announced by NIST in 2011 after a 5-year standardization process. It went into effect as a standard on May 26, 2002."
---

AES is fast both as software and hardware, relatively easy to implement, and it requires little memory.
AES is currently one of the most popular algorithms used in symmetric key cryptography. AES has a fixed block size 
of 128 bits and a key size of 128, 192, or 256 bits.

{{< image src="img/symmetric-encryption.jpg" >}}

AES is the fundamental encryption algorithm in Wault. It takes a key and some data (plain text) as input and converts 
that data into something that looks completely random (encrypted text). The only way to extract meaning from the 
encrypted text is to use AES and the same key to convert it back into plain text.

## AES implementation
Wault uses AES to encrypt the contents of your cards in GCM[^1] block chaining mode with 256-bit encryption key. 
GCM mode provides high-speed authenticated encryption and the integrity of user's data.

> The possible combinations increase exponentially with the size of the key.
> For 256 bits, it's 2^256 = 115792089237316195423570985008687907853269984665640564039457584007913129639936
> combinations. This is more than the number of atoms[^2] in the known, observable universe.

AES with a key length of 256 bits supports the largest bit size and is virtually unbreakable by brute force based 
on current computing power, making it the most secure encryption standard.

[^1]: [Galois/Counter Mode](https://en.wikipedia.org/wiki/Galois/Counter_Mode) Wikipedia.
[^2]: [How Many Atoms Are There in the Universe](https://www.universetoday.com/36302/atoms-in-the-universe/) Universe Today.

