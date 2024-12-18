Feature: Online Fake API-Passenger-PATCH

  @execute
Scenario: patch specific passenger with Id
Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'passenger/667ab7a37ad8fb59574343ed'
    * def passengerPatch = read('PatchPassenger.json')
 		 And request passengerPatch
    When method PATCH
    Then status 200	
    And match $.message == "Passenger data updated successfully."
    
    Scenario: patch specific passenger with Id without Authentication
    Given url secureBaseURL
    And path  'passenger/667ab7a37ad8fb59574343ed'
 		* def passengerPatch = read('PatchPassenger.json')
 		 And request passengerPatch
    When method POST
    Then status 400
     And match $.message == "You must send an Authorization header"