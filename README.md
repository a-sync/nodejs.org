[![npm (scoped)](https://img.shields.io/npm/v/nodejs.org.svg)](https://www.npmjs.com/package/nodejs.org) [![build status](https://secure.travis-ci.org/a-sync/nodejs.org.png)](https://travis-ci.org/a-sync/nodejs.org)

**[node.js](https://nodejs.org) static binaries for Linux, macOS and Windows.**

Supports Linux (32 and 64-bit), macOS (64-bit) and Windows (32 and 64-bit). 
The package version matches the version of the binaries.

## Installation

This module is installed via npm:

```sh
$ npm install nodejs.org
```

## Example Usage

Returns the path of a statically linked node binary on the local filesystem.

```js
const nodejsPath = require('nodejs.org').path;
console.log(nodejsPath);
// /Users/Dude/dev/nodejs.org/bin/darwin/x64/node
```

## Sources of the binaries

[The build script](build/index.sh) downloads binaries from the official release repository at [nodejs.org/download](https://nodejs.org/download).
