# Nix flake templates for easy dev environments

To initialize (where `${ENV}` is listed in the table below):

```shell
nix flake init --template github:the-nix-way/dev-templates#${ENV}
```

Here's an example (for the [`rust`](./rust) template):

```shell
# Initialize in the current project
nix flake init --template github:the-nix-way/dev-templates#rust

# Create a new project
nix flake new --template github:the-nix-way/dev-templates#rust ${NEW_PROJECT_DIRECTORY}
```

## How to use the templates

Once your preferred template has been initialized, you can use the provided shell in two ways:

1. If you have [`nix-direnv`][nix-direnv] installed, you can initialize the environment by running `direnv allow`.
2. If you don't have `nix-direnv` installed, you can run `nix develop` to open up the Nix-defined shell.

## Available templates

| Language/framework/tool | Template                  |
| :---------------------- | :------------------------ |
| [Dhall]                 | [`dhall`](./dhall/)       |
| [Elixir]                | [`elixir`](./elixir/)     |
| [Gleam]                 | [`gleam`](./gleam/)       |
| [Go] 1.17               | [`go1_17`](./go1.17/)     |
| [Go] 1.18               | [`go1_18`](./go1.18/)     |
| [Java]                  | [`java`](./java/)         |
| [Kotlin]                | [`kotlin`](./kotlin/)     |
| [Nix]                   | [`nix`](./nix/)           |
| [Node.js][node]         | [`node`](./node/)         |
| [Protobuf]              | [`protobuf`](./protobuf/) |
| [Rust]                  | [`rust`](./rust/)         |
| [Scala]                 | [`scala`](./scala/)       |
| [Zig]                   | [`zig`](./zig/)           |

## Template contents

The sections below list what each template includes. In all cases, you're free to add and remove packages as you see fit; the templates are just boilerplate.

### [`dhall`](./dhall)

- [Dhall] 1.40.2
- [`dhall-bash`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-bash)
- [`dhall-csv`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-csv) (Linux only)
- [`dhall-docs`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-docs)
- [`dhall-json`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-json)
- [`dhall-lsp-server`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-lsp-server)
- [`dhall-nix`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix)
- [`dhall-nixpkgs`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nixpkgs)
- [`dhall-openapi`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-openapi)
- [`dhall-text`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-text) (Linux only)
- [`dhall-toml`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-toml)
- [`dhall-yaml`](https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-yaml)

### [`elixir`](./elixir/)

- [Elixir] 1.13.4, including [mix] and [IEx]
- [Node.js][node] 18.7.0 (largely for [Phoenix] projects)

### [`gleam`](./gleam/)

- [Gleam] 0.22.1

### [`go1.17`](./go1.17/)

- [Go] 1.17
- Standard Go tools ([goimports], [godoc], and others)
- [golangci-lint]

### [`go1.18`](./go1.18/)

- [Go] 1.18
- Standard Go tools ([goimports], [godoc], and others)
- [golangci-lint]

### [`java`](./java)

- [Java] 17.0.3
- [Maven] 3.8.5
- [Gradle] 7.5
- [Ant] 1.10.11

### [`kotlin`](./kotlin/)

- [Kotlin] 1.7.10-release-333
- [Gradle] 7.5

### [`nix`](./nix/)

- [Cachix]
- [dhall-to-nix] 1.1.23
- [lorri]
- [niv]
- [nixfmt]
- [statix]
- [vulnix]

### [`node`](./node/)

- [Node.js][node] 18.7.0
- [pnpm] 7.3.0
- [Yarn] 1.22.19

### [`protobuf`](./protobuf/)

- The [Buf CLI][buf] 1.7.0
- [protoc][protobuf] 3.19.4

### [`rust`](./rust/)

- [Rust], including [cargo], [Clippy], and the other standard tools. The Rust version is determined as follows, in order:

  - From the `rust-toolchain.toml` file if present
  - From the `rust-toolchain` file if present
  - Version 1.6.2 if neither is present

- [rust-analyzer] 2022-07-11

### [`scala`](./scala/)

- [Scala] 3.1.0 ([Java] 17.0.3)
- [sbt] 1.6.2

### [`zig`](./zig/)

- [Zig] 0.9.1

## Code organization

All of the templates have only the root [flake](./flake.nix) as a flake input. That root flake provides a common revision of [Nixpkgs] and [`flake-utils`][flake-utils] to all the templates.

[ant]: https://ant.apache.org
[buf]: https://github.com/bufbuild/buf
[cachix]: https://www.cachix.org
[cargo]: https://doc.rust-lang.org/cargo
[clippy]: https://github.com/rust-lang/rust-clippy
[dhall]: https://dhall-lang.org
[dhall-to-nix]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix
[elixir]: https://elixir-lang.org
[flake-utils]: https://github.com/numtide/flake-utils
[gleam]: https://gleam.run
[go]: https://go.dev
[godoc]: https://pkg.go.dev/golang.org/x/tools/cmd/godoc
[goimports]: https://pkg.go.dev/golang.org/x/tools/cmd/goimports
[golangci-lint]: https://github.com/golangci/golangci-lint
[gradle]: https://gradle.org
[iex]: https://hexdocs.pm/iex/IEx.html
[java]: https://java.com
[kotlin]: https://kotlinlang.org
[lorri]: https://github.com/target/lorri
[maven]: https://maven.apache.org
[mix]: https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
[niv]: https://github.com/nmattia/niv
[nix]: https://nixos.org
[nixfmt]: https://github.com/serokell/nixfmt
[nixpkgs]: https://github.com/NixOS/nixpkgs
[nix-direnv]: https://github.com/nix-community/nix-direnv
[node]: https://nodejs.org
[phoenix]: https://phoenixframework.org
[pnpm]: https://pnpm.io
[protobuf]: https://developers.google.com/protocol-buffers
[rust]: https://rust-lang.org
[scala]: https://scala-lang.org
[statix]: https://github.com/nerdypepper/statix
[sbt]: https://www.scala-sbt.org
[vulnix]: https://github.com/flyingcircusio/vulnix
[yarn]: https://yarnpkg.com
[zig]: https://ziglang.org
