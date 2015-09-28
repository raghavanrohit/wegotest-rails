# Wego Test Ruby on Rails Frontend/Midtier App #

### Overview ###

* This app is a frontend/midtier app written in AngularJS/Ruby on Rails
* AngularJS communicates with the Ruby on Rails midtier by sending and receiving messages in JSON formats
* This app is hosted on Heroku --> https://wegotest.heroku.com
* The endpoint(s) exposed by this app are
  * find_airlines - GET request, produces/consumes JSON

### Cloning the app ###

```
git clone https://github.com/raghavanrohit/wegotest-rails
```

### Building the app ###

```
bundle install
```

### Executing test cases ###

```
rake test
```

#### Tests executed ####

* should find airlines between Mumbai and Singapore -> verifies successful response
* should find no airlines between Mumbai and Beijing -> verifies no data found response
* should throw missing input parameters for empty to request parameter -> verifies a bad request response for an empty 'to' request parameter
* should throw missing input parameters for empty from request parameter -> verifies a bad request response for an empty 'from' request parameter
* should throw missing input parameters for empty from and to request parameters -> verifies a bad request response for an empty request

### Running the app ###

```
rails server
```

* All requests served by the app can be viewed on the console
* To verify that the app has started successfully, type http://localhost:3000 in your favourite browser. It should display the Find Airlines page