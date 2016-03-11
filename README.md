AmaysimTest
===========

A Cucumber based test framework for Amaysim.

####Things to install on your machine 
(Google them to find installers):

1. git
2. ruby 2.1.x
3. bundler gem
4. chrome

####To set up the project on your machine:
1. `git clone https://github.com/hdushan/amaysimtest.git`
2. `bundle install`

####Rake targets to run tests:
- `rake chrome` *runs cucumber tests using chrome*
- `rake` or `rake firefox` *runs cucumber tests using firefox*
- `rake headless` *runs cucumber tests in headless mode (with phantomjs) NOTE: Not tested successfuly, phantomjs times out loading pages*

####To specify environment (currently only PROD) - Linux or OSX:
- `ENVIRONMENT=PROD rake` or `ENVIRONMENT=PROD rake firefox` or `ENVIRONMENT=PROD rake chrome`

####To specify environment (currently only PROD) - Windows:
1. `set ENVIRONMENT=PROD`
2. `rake` or `rake firefox` or `rake chrome`

####Link to CI Server (Snap-CI) that runs these tests against PROD:
https://snap-ci.com/hdushan/amaysimtest/branch/master

#### TODO improvements
- Store passwords encrypted
- Have Page Objects (perhaps use siteprism?)
- Couldnt get this working with Poltergeist/Phantomjs. Pages time out.
eg: Timed out waiting for response to {"id":"8dd5f2e1-6d55-4870-9962-d5941e5c5d90","name":"visit","args":["https://www.amaysim.com.au/my-account/my-amaysim/login/",300]}.