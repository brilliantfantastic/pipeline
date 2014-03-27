[ ![Codeship Status for brilliantfantastic/pipeline](https://www.codeship.io/projects/a364cd20-95fe-0131-e1bc-6e8a0237d18c/status?branch=master)](https://www.codeship.io/projects/16883)

pipeline / A simple way to plan your work week
==============================================
***

## DESCRIPTION

We all have busy lives. We need a way to help us focus on what to work on for a given week without a lot of work maintaining a system.

Pipeline allows you to plan your work week by splitting up hours between projects. Time is recorded against these projects using 
Freshbooks or Harvest (systems you already use to track your time).

Emails are sent to you throughout the week to help you keep focus.

## UI MOCKUP

Last week you worked __63 hours__

How many hours do you want to work this week? __________ 

[X] Apple        ---------=====------- __20 hours__

[X] Google       ----=====------------ __10 hours__

[X] GitHub       --=====-------------- __08 hours__

[ ] Harvest      ---------------------

[ ] Pipeline     ---------------------

==========================================================================

How your week is going:

|___|||_____||||||__________

M   T    W    T   F   S   S

## FEATURES

Features and stories are tracked using [GitHub Issues](https://github.com/brilliantfantastic/pipeline/issues)

## INSTALLATION

**Clone the repository**

```sh
git clone git@github.com:brilliantfantastic/pipeline.git
```

**Install node (if necessary)**

Pipeline's primary build tool is [Grunt](http://gruntjs.com/). In order to use Grunt, you must install [Node](http://nodejs.org) first if you don't already have it.

```sh
brew install node
```

**Install Grunt command-line tool (if necessary)**

Once you’ve installed Node, you’ll need to install the [Grunt command-line tool](http://gruntjs.com/using-the-cli) globally with:

```sh
npm install -g grunt-cli
```

**Install Bower (if necessary)**

You’ll need to install [Bower](http://bower.io), a package manager that keeps your front-end dependencies (including JQuery, Ember, and QUnit) up to date.

```sh
npm install -g bower
```

**Install the dependencies**

This will install the dependencies Grunt relies on to build. These dependencies are primarily various Grunt tasks that do everything from module compilation to test running.

The `npm install`’s `postinstall` hook runs for you `bower install` to install front-end dependencies.

```sh
npm install
```

## RUNNING LOCALLY

You can run the client side using a node server by running the following from the command-line.

```sh
grunt server
```

And then navigate to [http://localhost:8000](http://localhost:8000).

**A SPECIAL NOTE**

This project is strictly the front-end client. In order for the API calls to work, you will want to install the API locally as well. That project is located at
[`http://github.com/brilliantfantastic/pipeline-api`](http://github.com/brilliantfantastic/pipeline-api).

Follow that project's installation instructions in it's [`README`](https://github.com/brilliantfantastic/pipeline-api/blob/master/README.md) in order to run the API locally as well.

## RUNNING THE TESTS

To run the tests in your browser using the QUnit interface, run `grunt server` and navigate to [`http://localhost:8000/tests`](http://localhost:8000/tests). Note that just like your app, your tests will auto rebuild when `grunt server` is running.

```sh
grunt test
```

All tests have the API stubbed out and so the API backend does not have to be running.

* `grunt test:ci` runs your app’s tests in [PhantomJS](http://phantomjs.org/). For use in continuous integration. 
* `grunt test:browsers` runs your app’s tests in multiple browsers (see tasks/options/testem.js for configuration)
* `grunt test:server` will automatically watch and rebuild your application on changes. It will also rerun your tests automatically when your code is updated. Test results are output in the terminal and not the browser.
