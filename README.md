# Agama Security Key Project

<!-- These are statistics for this repository-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache License][license-shield]][license-url]

# About Agama-security Project

This repo is home to the Gluu Agama-securitykey project. Use this project to
authenticate using security devices (Yubico Key, Windows Hello, Touch ID on Mac, etc.).

## Where To Deploy

The project can be deployed to any IAM server that runs an implementation of
the [Agama Framework](https://docs.jans.io/head/agama/introduction/) like
[Janssen Server](https://jans.io) and [Gluu Flex](https://gluu.org/flex/).

## How To Deploy

Different IAM servers may provide different methods and
user interfaces from where an Agama project can be deployed on that server.
The steps below show how the Agama-securitykey project can be deployed on the
[Janssen Server](https://jans.io).
Deployment of an Agama project involves three steps.

- [Downloading the `.gama` package from project repository](#download-the-project)
- [Adding the `.gama` package to the IAM server](#add-the-project-to-the-server)
- [Configure the project](#configure-the-project)

### Pre-Requisites

Running instances of `Jans Auth Server`, `Jans Fido2', and `Jans Casa`

#### Add Java dependencies

1. Download
latest [agama-securitykey-custom.jar](https://github.com/GluuFederation/agama-security-key/releases/latest/download/agama-securitykey-custom.jar)
from [Releases](https://github.com/GluuFederation/agama-securitykey/releases)
2.'scp` the jar file to `/opt/jans/jetty/jans-auth/custom/libs/` on Auth Server.
3. On Auth Server, edit `/opt/jans/jetty/jans-auth/webapps/jans-auth.xml` and
add the jar file to the `<set name="extractClasspath">...</Set>` element. For example:


```
<Configure class="org.eclipse.jetty.webapp.WebAppContext">
   <Set name="contextPath">/jans-auth</Set>
   <Set name="war">
       <Property name="jetty.webapps" default="." />/jans-auth.war
   </Set>
   <Set name="extractWAR">true</Set>
   <Set name="extraClasspath">
      ...
      /opt/jans/jetty/jans-auth/custom/libs/agama-securitykey-custom.jar,
      ...
   </Set>
 </Configure>
```

4. Restart Auth Server to load the new jar:

```
systemctl restart jans-auth
```

#### Download the Project

> [!TIP]
> Skip this step if you use the Janssen Server TUI tool to
> configure this project. The TUI tool enables the download and adding of this
> project directly from the tool, as part of the `community projects` listing.

The project is bundled as
[.gama package](https://docs.jans.io/head/agama/gama-format/).
Visit the `Assets` section of the
[Releases](https://github.com/GluuFederation/agama-securitykey/releases) to download
the `.gama` package.




### Add The Project To The Server

The Janssen Server provides multiple ways an Agama project can be
deployed and configured. Either use the command-line tool, REST API, or a
TUI (text-based UI). Refer to
[Agama project configuration page](https://docs.jans.io/head/admin/config-guide/auth-server-config/agama-project-configuration/)
in the Janssen Server documentation for more details.

![TUI_DEPLOY](https://github.com/GluuFederation/agama-securitykey/assets/86965029/de25752e-3c86-4c67-a890-2e78494e4c6c)


### Configure The Project

The Agama project accepts configuration parameters in the JSON format. Every Agama
project comes with a basic sample configuration file for reference.

Below is a typical configuration of the agama-securitykey project. As shown, it contains
configuration parameters for the [flows contained in it](#flows-in-the-project):

Sample JSON
```
{
  "org.gluu.agama.securitykey.fidoAuthn": {},
  "org.gluu.agama.securitykey.main": {}
}
```

### Test The Flow

Use any relying party implementation (like [jans-tarp](https://github.com/JanssenProject/jans/tree/main/demos/jans-tarp))
to send an authentication request that triggers the flow.

From the incoming authentication request, the Janssen Server reads the `ACR`
parameter value to identify which authentication method should be used.
To invoke the `org.gluu.agama.securitykey.main` flow contained in the Agama-securitykey project,
specify the ACR value as `agama_<qualified-name-of-the-top-level-flow>`,
i.e `agama_org.gluu.agama.securitykey.main`.

## Customize and Make It Your Own

Fork this repo to start customizing the Agama-securitykey project. It is possible to
customize the user interface provided by the flow to suit your organisation's
branding
guidelines. Or customize the overall flow behavior. Follow the best
practices and steps listed
[here](https://docs.jans.io/head/admin/developer/agama/agama-best-practices/#project-reuse-and-customizations)
to achieve these customizations in the best possible way.
This project can be reused in other Agama projects to create more complex
authentication journeys.   To reuse trigger the
[org.gluu.agama.securitykey.main](#flows-in-the-project) flow from other Agama projects.

To make it easier to visualise and customize the Agama Project, use
[Agama Lab](https://cloud.gluu.org/agama-lab/login).


## Flows In The Project


| Qualified Name | Description |
|----------------|-------------|
| `org.gluu.agama.securitykey.main`| When the main flow of this project is launched, the user's browser is redirected to a view where they must first enter their username, then validate one of the security keys that they have. configured for their user (Yubico Key, Windows Hello, Touch ID on Mac, etc.). Finally, the user's browser is redirected to the registered URI.

> **Note:** You must have registered security devices for your user; to register, you must use **Jans Casa**.

# Demo

Check out this video to see the **agama-securitykey** authentication flow in action.
Also check the
[Agama Project Of The Week](https://gluu.org/agama-project-of-the-week/) video
series for a quick demo on this flow.

*Note:*
While the video shows how the flow works overall, it may be dated. Do check the
[Test The Flow](#test-the-flow) section to understand the current
method of passing the ACR parameter when invoking the flow.

![TEST_AGAMA_SECURITY_KEY](https://github.com/GluuFederation/agama-securitykey/assets/86965029/53baa0ab-d2d0-4e5f-a3c1-7c15c2dc48be)


<!-- This is the stats url reference for this repository -->

[contributors-shield]: https://img.shields.io/github/contributors/GluuFederation/agama-security-key.svg?style=for-the-badge

[contributors-url]: https://github.com/GluuFederation/agama-security-key/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/GluuFederation/agama-security-key.svg?style=for-the-badge

[forks-url]: https://github.com/GluuFederation/agama-security-key/network/members

[stars-shield]: https://img.shields.io/github/stars/GluuFederation/agama-security-key?style=for-the-badge

[stars-url]: https://github.com/GluuFederation/agama-security-key/stargazers

[issues-shield]: https://img.shields.io/github/issues/GluuFederation/agama-security-key.svg?style=for-the-badge

[issues-url]: https://github.com/GluuFederation/agama-security-key/issues

[license-shield]: https://img.shields.io/github/license/GluuFederation/agama-security-key.svg?style=for-the-badge

[license-url]: https://github.com/GluuFederation/agama-security-key/blob/master/LICENSE
