quickquote
==========

A Cucumber based test framework for Amaysim.

####Things to have installed on your machine 
(Google them to find installers):

1. git
2. ruby 2.1.x
3. bundler gem
4. chrome

####To set up the project on your machine:
1. `git clone https://github.com/hdushan/quickquote.git`
2. `bundle install`

####Rake targets to run tests:
- `rake` *runs cucumber tests in headless mode (with phantomjs)*
- `rake headless` *runs cucumber tests in headless mode (with phantomjs)*
- `rake chrome` *runs cucumber tests using chrome*

####To specify environment (currently only PROD) - Linux or OSX:
- `ENVIRONMENT=PROD rake` or `ENVIRONMENT=PROD rake headless` or `ENVIRONMENT=PROD rake chrome`

####To specify environment (currently only PROD) - Windows:
- `set ENVIRONMENT=PROD`
- `rake` or `rake headless` or `rake chrome`