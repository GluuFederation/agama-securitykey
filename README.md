# Agama Security Key Project

<!-- These are statistics for this repository-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache License][license-shield]][license-url]

Use this project to authenticate using security devices (Yubico Key, Windows Hello, Touch ID on Mac, etc.)

## How it works at a glance

When a main flow of this project is launched (namely `io.jans.agama.securitykey.main`) the user's browser is redirected
to a view where he/she must first enter his/her username, then validate one of the security keys that he/she has
configured for his/her user (Yubico Key, Windows Hello, Touch ID on Mac, etc.). Finally, the user's browser is
redirected to the registered URI.

> **Note:** You must have registered security devices to your user, to register you must use **Jans Casa**. 

## Project Deployment

To deploy this project we need to meet the requirements.

### Requirements

1. Running instance of `Jans Auth Server`, `Jans Fido2` and `Jans Casa` 

### Add Java dependencies
1. Download latest [agama-securitykey-custom.jar](https://github.com/GluuFederation/agama-security-key/releases/latest/download/agama-securitykey-custom.jar) from [Releases](https://github.com/GluuFederation/agama-securitykey/releases)
2. `scp` the jar file to `/opt/jans/jetty/jans-auth/custom/libs/` on Auth Server
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
````

### Deployment

Download the latest [agama-securitykey.gama](https://github.com/GluuFederation/agama-securitykey/releases/latest/download/agama-securitykey.gama) file and deploy it in Auth Sever.

Siga los siguientes pasos:
- Copy (SCP/SFTP) the gama file of this project to a location in your `Jans Server`
- Connect (SSH) to your `Jans Server` and open TUI: `python3 /opt/jans/jans-cli/jans_cli_tui.py`
- Navigate to the `Agama` tab and then select `"Upload project"`. Choose the gama file
- Wait for about one minute and then select the row in the table corresponding to this project
- Press `d` and ensure there were not deployment errors
- Pres `ESC` to close the dialog

## Configuration

After deploying the `agama-hello` project, extract the sample configuration:
1. Move to the top of the agama-project using `jans-tui` then press `c` It will popup with the below options:
   ![Screenshot 2023-11-08 at 11 32 48 AM](https://github.com/GluuFederation/agama-hello/assets/20867846/8ccc6bd2-6dc2-4c79-920a-db5cc687c8b5)
1. Select `export sample config` to extract sample configuration into a file.
   ![Screenshot 2023-11-08 at 11 29 48 AM](https://github.com/GluuFederation/agama-hello/assets/20867846/53178b8d-5d5d-45b6-9017-fa7bc4f54fe0)
1. Modify the configuration file with your **hello.coop** client credentials,
   which you can find in the [console page](https://console.hello.coop) :
```
    {
      "hello.agama.inbound.hello": {},
      "hello.agama.inbound.hello_user": {},
      "hello.agama.inbound.main": {
        "hello": {
          "clientId": "CLIENT_IDENTIFIER",      <--- ADD YOUR CLIENT ID
          "clientSecret": "CLIENT_SECRET",      <--- ADD YOUR CLIENT SECRET
          "authzEndpoint": "https://wallet.hello.coop/authorize",
          "tokenEndpoint": "https://wallet.hello.coop/oauth/token",
          "userInfoEndpoint": "https://wallet.hello.coop/oauth/userinfo",
          "scopes": [
            "openid"
          ],
          "clientCredsInRequestBody": true,
          "custParamsAuthReq": {},
          "custParamsTokenReq": {},
          "redirectUri": null
        },
        "uidPrefix": ""
      }
    }
```
1. Import the modified configuration file using **`Import Configuration`** option.
   It will show successful result like below picture:
   ![import success](https://github.com/GluuFederation/agama-hello/assets/20867846/141cb8b8-4e8f-46f9-ada6-1d2228956197)

Setup is done! Now, let's test our deployment!

## Testing

You'll need an OpenID Connect test RP. You can try [oidcdebugger](https://oidcdebugger.com/),
[jans-tarp](https://github.com/JanssenProject/jans/tree/main/demos/jans-tarp) or [jans-tent](https://github.com/JanssenProject/jans/tree/main/demos/jans-tent). Check out this video to see
an example of **agama-hello** in action:
![ezgif com-video-to-gif](https://github.com/GluuFederation/agama-hello/assets/20867846/2158f064-ff8b-430f-a382-32e5e360a3cf)

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

This project is licensed under the [Apache 2.0](https://github.com/GluuFederation/agama-security-key/blob/main/LICENSE)

# Acknowledgments

This project based on [agama-openid](https://github.com/GluuFederation/agama-openid).

<!-- This are stats url reference for this repository -->
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
