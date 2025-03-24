# NEAR Command Line Interface

Run the NEAR cli using Nix.

# Run as Nix flake

> [!NOTE]
> Requires Nix to be installed. Installation on linux can be done through `sh <(curl -L https://nixos.org/nix/install) --daemon`. For other platforms please refer to [the official installation guide](https://nixos.org/download/).

## Interactive mode

```sh
nix run github:Openmesh-Network/near-cli  --experimental-features 'nix-command flakes' --accept-flake-config
```

## Command

1. Replace `near` with `nix run github:Openmesh-Network/near-cli --experimental-features 'nix-command flakes' --accept-flake-config`.
1. Repeat all normal arguments.
1. Add `--` and repeat all arguments starting with `-` or `--` after it.

### Example

```sh
near call openmesh.pool.near ping '{}' --accountId dcb56967d85ca66c1d991b011540887990b46ac09923d3c3891f47334ef9c941 --gas=300000000000000 --network-id=mainnet
```

becomes

```sh
nix run github:Openmesh-Network/near-cli --experimental-features 'nix-command flakes' --accept-flake-config call openmesh.pool.near ping '{}' -- --accountId dcb56967d85ca66c1d991b011540887990b46ac09923d3c3891f47334ef9c941 --gas=300000000000000 --network-id=mainnet
```

## Update flake

Nix will run a previously downloaded version if available. Run this command to update to the latest version.

```sh
nix flake update --flake github:Openmesh-Network/near-cli
```
