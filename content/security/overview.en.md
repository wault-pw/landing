---
title: "Encryption algorithms"
linkTitle: "Algorithms"
weight: 10
aux: "To avoid storing data on the server, the Wault password manager encrypts and decrypts data inside the browser. 
The keys for all encryption processes are derived from the password, which is never sent to the server."
---

In simple terms, Wault password manager is an online service that knows nothing about its users.
Wault looks like an ordinary web application, but hides a powerful cryptographic mechanism entirely
created and executed in your browser.

Based on this idea, we developed and implemented a web application architecture that supports your privacy. 
The main idea was to create a trust-free service, where users could trust the data within the browser, regardless of 
external sources.

## Wault cloud

Wault Cloud is a web application that is loaded into your browser memory before your credentials are entered into 
the login/registration form. Wault does not automatically reload during a user's interaction with the application 
and does not transfer control to the server. This type of web application is commonly referred to as Single-Page 
Application (SPA).

> SPA shifts the logic from the server to the client. This causes the web server role to become a pure
> API or Web service. This architectural shift has been called "thin server architecture" in some circles
> to emphasize that all the logic has been moved from the server to the client.[^1]

There's a very good reason to design Wault as a single-page application: if additional pieces of source code are 
downloaded from the server after logging in, the user will have no way to check the security of the web application. 
Therefore, in Wault, *not a single line of Javascript* is moved to the browser after successful authentication of the user.

## Wault backup
As a SPA, Wault can run from a local file using a URI scheme. This gives users the opportunity to download and verify 
the Wault code once and then run the file locally without having to download the server version every time they need to 
use the password manager.

## Cryptographic algorithms
Wault is built on proven and reliable cryptographic algorithms:
[AES]({{< relref "/security/aes" >}}), SHA, [SRP6a]({{< relref "/security/srp" >}}),
[RSA]({{< relref "/security/rsa" >}}), HMAC, PBKDF2.

Careful implementation of the basic algorithms is necessary to create the Javascript crypto engine on which
any web application operates with server-side security. In 2022, we had the choice of using cryptographic
primitives built into the browser[^2].

Cryptographic algorithms evolve over time. If necessary, Wault can modernize its cryptography basics by replacing 
some primitives. This will happen unnoticed by the user and without changing the overall user experience.

## 265-bit security level.
Wault is a cryptographic system with a 256-bit security level. Cryptographers agree that a 256-bit level of security 
will be enough to protect against brute force attacks for the foreseeable future. But, of course, no aspect of system 
design should be overlooked, from algorithm selection to terms of use

{{< image src="img/security.jpg" >}}

Don't be confused by our use of AES-256 or SHA-256. There is no one-to-one relationship between the security level and 
the underlying parameter of a cryptographic primitive (e.g., key size for ciphers, output size for hash functions, etc.).

## Conclusions.
We are not here to reinvent cryptography. However, we do want to change the balance of power between
users of web applications and service providers in favor of the former. We want to create web applications
that give the average user the most advanced cryptographic protection of their data.

> Encryption is a powerful protective weapon for free people. It offers a technical guarantee of
> privacy, no matter who's running the government... It's hard to think of a more powerful and less
> dangerous instrument of freedom.

Today, you can edit documents, store files, send messages, and do many other tasks right from your browser. 
Storing your data in the cloud is great, but what about privacy, security, and, ultimately, freedom? It's still your 
data, and you should have exclusive ownership and control over it.

Unfortunately, today you have no choice but to trust web application providers and hope that they act properly.

> We understand that the web stack will never be perfect, but it always catches up and has
> the broadest coverage.

Web cryptography can lead a revolution in the web ecosystem by harnessing the full power of cryptographic algorithms
running in your browser.

We want to continue to contribute to the development of web cryptography, we want to help expand the community of
of users, developers, and security experts. We want to make web cryptography a useful,
flexible, and secure technology to protect data on the Internet.

[^1]: [Single-page application](https://en.wikipedia.org/wiki/Single-page_application) Wikipedia.
[^2]: [Web Crypto API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Crypto_API) MDN.
