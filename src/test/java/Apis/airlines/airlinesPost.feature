 Feature: Online Fake API-Airline-Create
 
 
 		Scenario: Add airline details using json from file
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'airlines'
    * def airlinesPaylod = read('AirlinePayload.json')
    And request airlinesPaylod
    When method POST
    Then status 200
  	And match $._id != null
  	
  	
 		Scenario: Add airline details using json from file without authentication
    Given url secureBaseURL
    And path 'airlines'
    * def airlinesPaylod = read('AirlinePayload.json')
    And request airlinesPaylod
    When method POST
    Then status 400
  	And match $.message == "You must send an Authorization header"