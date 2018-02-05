'use strict';

const test = require('ava');
const fs = require('fs');
const nodejs = require('..');

test('should find nodejs', t => {
    const stats = fs.statSync(nodejs.path);
    t.true(stats.isFile(nodejs.path));
});
