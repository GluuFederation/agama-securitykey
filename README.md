# Agama Security Key

The flow is focused on logging in using only your username and at least 1 security key configured.

## Requirements

A Janssen server installation with `fido2`, `config-api` and `casa`

## Enabling Agama

To enable `Agama` in Janssen server follow the
instructions [here](https://docs.jans.io/head/admin/developer/agama/engine-bridge-config/#availability).

## How to Deploy

To build the actual archive, download the agama inbound
identity [jar](https://maven.jans.io/maven/io/jans/agama-inbound/) (suffixed `with-dependencies`) inside `lib`.

Finally, execute the following command:

```
bash build.sh
```

After executing this command, in the root of this project you should have the following file `agama-security-key.gama`.

### Deployment with TUI

1. Open `TUI` using following commands on `Janssen Server`

```
cd /opt/jans/jans-cli
python3 jans_cli_tui.py
```

3. Navigate to `Auth Server > Agama > Upload Project`. Select the `.gama` file to upload.
