Feature: Online Fake API-Passenger-Get

Scenario: Get specific passenger details with Id
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'passenger/674edf3aabdcface7e6f71aa'
    When method GET
    Then status 200
		And match $._id == "674edf3aabdcface7e6f71aa"
		And match $.name =="John Doe"
		And match $.airline[0]._id == "c3f9f0fb-dd78-4152-bafa-85003904a7f1"
    And match $.airline[0].name == "Fly Greece"
    
    
Scenario: Get specific passenger details without Authentication
    Given url secureBaseURL
    And path 'passenger/674edf3aabdcface7e6f71aa'
    When method GET
    Then status 400
		And match $.message == "You must send an Authorization header"
		
		
Scenario: Get specific passenger details invalid Id
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'passenger/674'
    When method GET
    Then status 204
    
    

Scenario: Get specific passenger details
    Given url secureBaseURL
    And path 'passenger'
     And param page = 10
    And param size = 10
    And header Authorization = 'Bearer '+authInfo.authToken
    When method GET
    Then status 200
    #And match $.data.length == 10
       
       
Scenario: Get specific passenger details without Authentication
    Given url secureBaseURL
    And path 'passenger'
     And param page = 10
    And param size = 10
    When method GET
    Then status 400
		And match $.message == "You must send an Authorization header"
       