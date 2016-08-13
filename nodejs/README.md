# Dockerfiles NodeJS

This repository contains file for creating a dockerfile
with that I can use NodeJS in docker sandbox


```
docker run -it --rm  -v "$(pwd)":/home/src janbaer/nodejs
```

This container has the following global node modules installed:

- gulp
- karma-cli
- typescript
- eslint
- live-server
- mocha

To execute all tests in the current directory you just have to call
**run-tests**. To execute the tests and go into the watch mode **watch-tests**
As testrunner [Mocha](http://mochajs.org/) will be used. For the assertions you
can use the [Node.js assert module](https://nodejs.org/api/assert.html)

```
'use strict'
const assert = require('assert');

describe('First spec', () => {
  it('should be equal', () => {
    assert.equal(1, 2);
  });
});
```

To lint the code in the current directory with [eslint](http://eslint.org/) just enter **lint**

