# Proxy Skill

TRIGGER when: network requests fail, packages can't be downloaded, API calls time out, or user mentions needing proxy/VPN.

On this machine, run the following command in the CLI to enable the proxy:

```bash
proxy
```

This is a local CLI command/alias configured on this machine that enables the network proxy.

## When to suggest this

- `curl` / `wget` requests fail or time out
- `npm install`, `pip install`, `brew install` fail due to network issues
- Any tool that needs internet access fails in a way that looks like a network block
- User explicitly asks to enable proxy

## Usage

Just run:
```bash
proxy
```
