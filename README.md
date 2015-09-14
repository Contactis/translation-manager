# Translation Manager
> by iTelo

Project had been created for iTelo's project [Profitelo](http:///profitelo.pl)

Main goal of this product is to provide all neccessary features to store,
maintain, manage and deploy translations for your projects. It should help you
and your teams (dev, translators, PR and management) to cooperate with tons of
translations.


## Table of contents
* [Installation](#installation)
  * [Requirements](#requirements)
  * [Setup](#setup)
* [Development](#development)
* [Licence](#license)


## Installation
Project is build entirely with javascript, backend based on [node.js][node.js]
and platform and frontend part becongs to AngularJS.  Therefor
[npm](https://www.npmjs.com/) and [Bower](http://bower.io/) are used.

### Requirements
Before [setup](#setup) you need to have few programs already installed on your
machine, and these programs are:
- [node.js][node.js]

### Setup
```
git clone git@bitbucket.org:egel/translations-generator.git
cd translations-generator
sudo npm install && sudo npm install -g gulp bower sequelize-cli nodemon
cd frontend && bower install
```

## Development
All official things that is combined with development process like: app
structure, frontend and backend side and other elaboration stuff are gathered in
part called [**development**][wiki-development] into our Wiki pages. To see more
visit our [wiki pages][wiki].

## Licence
```
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


 [node.js]: https://nodejs.org
 [wiki]: https://bitbucket.org/egel/translations-manager/wiki/browse/
 [wiki-development]: https://bitbucket.org/egel/translations-manager/wiki/browse/
