Feature: Online Fake API-Passenger-DELETE


Scenario: Delete specific passenger with Id
Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'passenger/667ab7a37ad8fb59574343ed'
    When method DELETE
    Then status 200
    And match $.message == "Passenger data deleted successfully."		
    
    
Scenario: Delete specific passenger without Authentication
Given url secureBaseURL
    And path 'passenger/667ab7a37ad8fb59574343ed'
    When method DELETE
    Then status 400
     And match $.message == "You must send an Authorization header"		