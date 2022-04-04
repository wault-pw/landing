---
title: "Source Code"
hero: "img/docker.png"
aux: "In the world of cryptography, it is believed that open source is necessary for good security:
public security is always more reliable than private security."
---

A fundamental [assumption](https://en.wikipedia.org/wiki/Kerckhoffs%27s_principle) of cryptanalysis that was 
first formulated by August Kirchoff in the 19th century is that the secrecy must consist entirely in the 
encryption key. Kirchoff assumes that the crypto-analyst has complete information about the cryptographic 
algorithm and its implementation. Claude Shannon restated it as «the enemy knows the system».

## Technology stack

Server application of the password manager was written in go, web-application
called "eva" is written in TypeScript with Nuxt and VueJS. Communication between
client and the server is carried out via the REST API protocol using Google Protocol Buffers.
The application uses a PostgreSQL database.

The source code of the application and all the libraries is available at [GitHub](https://github.com/wault-pw).
Besides, all the services are available as separate [Docker](https://hub.docker.com/r/shlima/wault) containers
that can be launched locally or on one's server.
