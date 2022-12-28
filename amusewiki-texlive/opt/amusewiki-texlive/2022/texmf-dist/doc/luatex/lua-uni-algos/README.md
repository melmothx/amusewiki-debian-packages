# The lua-uni-algos Package

Version: v0.4.1

Date: 2022-02-26

Author: Marcel Krüger

License: LPPL v1.3

A collection of small Lua modules implementing some if the most generic Unicode algorithms for use with LuaTeX.
This package tries to reduce duplicated work by collecting a set of small utilities which can be used be useful for many LuaTeX packages dealing with Unicode strings.
There is no user-level functionality provided.

Additional Unicode algorithms will be added in the future, if you need a specific algorithm feel free to open an issue on GitHub.


## Requirements

Given that this package provides Lua modules, it is only useful in Lua(HB)TeX.
Additionally, it expects an up-to-date version of the `unicode-data` package to be present.


## Support
If you found a bug, please open an [issue on GitHub](https://github.com/latex3/lua-uni-algos/issues).

## Installation

In most cases it is best to use an official release provided by your TeX distribution.
If you want to install an experimental build directly from the repository, use `l3build install`.
