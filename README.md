<!-- These are statistics for this repository-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache License][license-shield]][license-url]

# Agama Security Key

Welcome to the https://github.com/GluuFederation/agama-securitykey project. This project is governed by Gluu and published under an Apache 2.0 license.

Use this project to add user authentication with **SecurityKey**(Yubico Key, Windows Hello, Touch ID on Mac, etc.)

For more information you can also see
* [What is FIDO](https://fidoalliance.org/what-is-fido/)
* [How FIDO Works](https://fidoalliance.org/how-fido-works/)
* [FIDO Specs](https://www.w3.org/TR/webauthn-1)

## Supported IDPs

| IDP              | Description                                                        |
|:-----------------|:-------------------------------------------------------------------| 
| Jans Auth Server | [Deployment instructions](https://docs.jans.io/head/admin/install) | 
| Gluu Flex        | [Deployment instructions](https://docs.gluu.org/head/install)      |

## Flows

| Qualified Name                         | Description                                                                                                                                                                                                                                                                                                                                                                                           |
|----------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| `org.gluu.agama.securitykey.main`      | This is the main flow that you can start directly from the browser. To use this first flow, make sure you have at least one `security key` configured, this can be done from **JANS CASA**. In this first view you will only be asked for your username and then you will be redirected to the `org.gluu.agama.passkey.fidoAuthn` flow where the validation of your security key device will be done. | 
| `org.gluu.agama.securitykey.fidoAuthn` | This flow is used to perform the `security key` validation, you have the option to cancel the process. If you complete the flow successfully, you will be granted access.                                                                                                                                                                                                                             | 

## Configuration

This agama project does not need any additional configuration to run its flow.

## Demo

![TEST_AGAMA_SECURITY_KEY](https://github.com/GluuFederation/agama-securitykey/assets/86965029/53baa0ab-d2d0-4e5f-a3c1-7c15c2dc48be)

# Contributors

<table>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Milton-Ch>
            <img src=https://avatars.githubusercontent.com/u/86965029?v=4 width="100;"  style="border-radius:50%;align-items:center;justify-content:center;overflow:hidden;padding-top:10px" alt=Milton Ch/>
            <br />
            <sub style="font-size:14px"><b>Milton Ch.</b></sub>
        </a>
    </td>
</tr>
</table>

# License

This project is licensed under the [Apache 2.0](https://github.com/GluuFederation/agama-securitykey/blob/main/LICENSE)

<!-- This are stats url reference for this repository -->

[contributors-shield]: https://img.shields.io/github/contributors/GluuFederation/agama-securitykey.svg?style=for-the-badge

[contributors-url]: https://github.com/GluuFederation/agama-securitykey/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/GluuFederation/agama-securitykey.svg?style=for-the-badge

[forks-url]: https://github.com/GluuFederation/agama-security-key/network/members

[stars-shield]: https://img.shields.io/github/stars/GluuFederation/agama-securitykey?style=for-the-badge

[stars-url]: https://github.com/GluuFederation/agama-securitykey/stargazers

[issues-shield]: https://img.shields.io/github/issues/GluuFederation/agama-securitykey.svg?style=for-the-badge

[issues-url]: https://github.com/GluuFederation/agama-securitykey/issues

[license-shield]: https://img.shields.io/github/license/GluuFederation/agama-securitykey.svg?style=for-the-badge

[license-url]: https://github.com/GluuFederation/agama-securitykey/blob/master/LICENSE
