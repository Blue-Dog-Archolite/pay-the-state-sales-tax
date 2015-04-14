# pay-the-state-sales-tax
Pay The Sate Sales Tax


* create a rails 4 app, using rspec and postgres db
* Make a form that accepts zip and country code (US or CA)
* clicking a button submits the form and shows the api result
* The form data should be passed to the taxjar api locations rate lookup endpoint (https://api.taxjar.com/locations/)
* save each form request to a database table of your own design to track lookups
* write at least 1 spec to test the result is as expected.
* You can figure out how to get a token in the docs, http://www.taxjar.com/api/
