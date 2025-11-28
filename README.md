# vfox-bpkg

A [vfox](https://github.com/version-fox/vfox) plugin for [bpkg](https://github.com/bpkg/bpkg) - a lightweight bash package manager.

## Installation

```bash
# With mise
mise install vfox:mise-plugins/vfox-bpkg@1.1.3

# With vfox
vfox add mise-plugins/vfox-bpkg
vfox install bpkg@1.1.3
```

## Usage

```bash
# With mise
mise use vfox:mise-plugins/vfox-bpkg@1.1.3
bpkg --version

# Or run directly
mise x vfox:mise-plugins/vfox-bpkg@1.1.3 -- bpkg --help
```

## How it works

This plugin downloads the bpkg source tarball from GitHub releases and copies the bash scripts to a bin directory. No compilation is required since bpkg is written entirely in bash.

## License

Apache-2.0
