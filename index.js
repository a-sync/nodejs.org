'use strict';

const os = require('os');
const path = require('path');

const platform = os.platform();
if (platform !== 'linux' && platform !== 'darwin' && platform !== 'win32') {
    throw new Error('Unsupported platform.');
}

const arch = os.arch();
if ((platform === 'darwin' || platform === 'linux') && arch !== 'x64') {
    throw new Error('Unsupported architecture.');
}

const nodejsPath = path.join(
    __dirname,
    'bin',
    platform,
    arch,
    platform === 'win32' ? 'node.exe' : 'node'
);

exports.path = nodejsPath;
