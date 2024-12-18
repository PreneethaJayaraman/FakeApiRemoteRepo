Feature: Online Fake API-Passenger-Post

Scenario: Post specific passenger details 
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'passenger'
 		* def passengerPaylod = read('PassengerPayload.json')
 		 And request passengerPaylod
    When method POST
    Then status 200
    And match $.name == "John Doe"
    And match $.airline[0]._id == "459a01fe-57d4-4bc7-9692-3a4568bca4e6"


Scenario: Post specific passenger details  without Authentication
    Given url secureBaseURL
    And path 'passenger'
 		* def passengerPaylod = read('PassengerPayload.json')
 		 And request passengerPaylod
    When method POST
    Then status 400
     And match $.message == "You must send an Authorization header"
   