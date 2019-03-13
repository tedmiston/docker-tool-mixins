# Docker Tool Mixins

An experimental Bash microframework for installing and (re)using tools in Dockerfiles.

## Tools

The following tools are currently supported:

- [bat](https://github.com/sharkdp/bat)
- [bats-core](https://github.com/bats-core/bats-core)
- [curl](https://github.com/curl/curl)
- [httpie](https://github.com/jakubroztocil/httpie)
- [man](https://en.wikipedia.org/wiki/Man_page)
- [shellcheck](https://github.com/koalaman/shellcheck)
- [tree](https://en.wikipedia.org/wiki/Tree_(command))

Adding a new tool is as simple as creating script(s) for the tool lifecycle stages below.

## Quickstart

The easiest way to get started is building an image of the existing tools.

```
make build  # build the docker image (includes all tools by default)
make run    # run the image
make lint   # lint the code
```

You can instead use the convenient included aliases for a faster dev cycle:

```
source alias_setup.sh

b  # build
r  # run
l  # lint
```

For development convenience, you can chain aliases like `b && r`.

To list all available aliases: `./alias_list.sh`

To add a new tool, look at an already configured tool in `/tools`.  A minimal example is `curl`.  Some fancier examples are `bats` and `shellcheck`.

## Tool Lifecycle

The tool lifecycle consists of four stages (all optional):

1. Setup (`tools/my-tool/setup.sh`) - pre-install requirements like system package build dependencies
1. Install (`tools/my-tool/install.sh`) - install the package
1. Teardown (`tools/my-tool/teardown.sh`) - clean up if installed manually from source, remove build dependencies, etc
1. Verify (`tools/my-tool/verify.sh`) - generally run the binary's version command to ensure it works

Each stage defined by its `tools/my-tool/<stage name>.sh` script.  Each step in a stage is simply a Bash command or function call.  These stages are created by writing small scripts using the standard library of helper functions found in `lib`.

Commonly shared variables can be put in `tools/my-tool/_vars.sh` which is sourced in the lifecycle stages.

## Global Lifecycle

There are also two global stages:

1. Setup (`tools/_setup.sh`) - like the tool setup stage but before all tools
1. Teardown (`tools/_teardown.sh`) - like the tool teardown stage but after all tools

Common commands are provided in the `Makefile` and convenient aliases are also available in `alias_setup.sh`.
