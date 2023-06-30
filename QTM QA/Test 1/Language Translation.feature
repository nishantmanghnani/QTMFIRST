Feature: Language Translation.feature
    As a user,
    I want to see application labels and messages in my own language
    So that I can understand what the application is saying

Background: 
Given the following languages exist:
  | Name    | Culture |
  | English | en-US   |
  | Polish  | pl      |
  | Italian | it-IT   | 
And the following translations exist:
  | Language | Key                 | Translation             |
  | English  | Invalid Login       | Invalid Login           |
  | Polish   | Invalid Login       | Nieprawidłowy login     |
  | Italian  | Invalid Login       | Login non valido        |
  | English  | Site is Unavailable | Invalid Login           |
  | Polish   | Site is Unavailable | Strona jest niedostępna |
  | Italian  | Site is Unavailable | Sito non è disponibile  |
And the following sites exist:
  | Name         | DefaultLanguage |
  | Test Site #1 | English         | 

And the following users exist:
  | FirstName | LastName  | UserName   | Language |
  | Frank     | Castillo  | fcastillo  | Italian  |
  | Doug      | Messerski | dmesserski | Polish   |
  | Peter     | Jones     | pjones     |          |
 

Scenario: Receive Messages in my Set Language
    Given I am the user "fcastillo"
    When the system sends the message "Invalid Login"
    Then I should see the error message "Login non valido"

Scenario: Receive a Message in my Site Set Language
    Given I am the user "pjones"
        And my site language is set to "Polish"
    When the system sends the message "Invalid Login"
    Then I should see the error message "Nieprawidłowy login"

Scenario: Change the language I use
    Given I am the user "dmesserski"
    When I set my my language to "Italian"
    Then my language should be equal to "Italian"

In this next example we show another example of allowing the user to change his default language. 

Feature: Change Default Language
  As "Eddie" 
  I want to be able to change my default language
  So that I can read the UI and messages in my preferred language.

Background:
Given the following languages exist:
  | Name    | Culture |
  | English | en-US   |
  | Polish  | pl      |
  | Italian | it-IT   | 
    
And the following translations exist:
  | Language | Key                 | Translation             |
  | English  | Profile updated     | Profile updated         |
  | Polish   | Profile updated     | Profil zaktualizowany   |
  | Italian  | Profile updated     | Profilo aggiornato      |
  | English  | Site is Unavailable | Site is Unavailable     |
  | Polish   | Site is Unavailable | Strona jest niedostępna |
  | Italian  | Site is Unavailable | Sito non è disponibile  |

And the following users exist:
  | FirstName | LastName | UserName | Language |
  | Jimmy     | Parker   | jparker  |          |
  | Paige     | Davis    | pdavis   | Polish   |

Scenario: Change Default Language
    Given I am logged into the system as "jparker"
    When I update my language to "Polish"
    Then my default language should be updated to "Polish"
        And I should see the message "Profil zaktualizowany"

Scenario: Update Default Language
    Given I am logged into the system as "pdavis"
    When I update my language to "Italian"
    Then my default language should be updated to "Italian"
        And I should see the message "Profilo aggiornato"