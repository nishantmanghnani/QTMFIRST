Feature: Login button
A user should be able to login by entering their credentials and clicking on a button.
Provided the user enters a valid username and password, the button should take them to
their homepage.

Scenario: User enters valid credentials
Given the user is on a page with the login form
And the user has entered the username “test1”
And the user has entered the password “Pass123”
When he clicks login
Then the user is taken to his homepage

Scenario: User forgets their password
Given the user is on a page with the login fields
And the user has entered the username “test1”
When he clicks the “Forgot password” link
Then the user is taken to the reset password page

Scenario: User enters invalid credentials
Given the user is on a page with the login fields
And the user has entered the username “test1”
And the user has entered the password “Pass321”
When he clicks the login button
Then the login form is displayed again with the username still populated and an error message
Character test - `~1!2@3#4$5%6^7&8*9(0)-_=+[{]}\|;:'"/?.>,<
login feature.feature