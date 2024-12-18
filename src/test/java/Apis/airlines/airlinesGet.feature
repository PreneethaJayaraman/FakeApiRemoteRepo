Feature: Online Fake API-Airlines-Get

	
  Scenario: Get all airlines details
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'airlines'
    When method GET
    Then status 200
    
   
    Scenario: Get all airlines details without authentication
    Given url secureBaseURL
    And path 'airlines'
    When method GET
    Then status 400
    And match $.message == "You must send an Authorization header"

 
  Scenario: Get specific airline details base on id
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method GET
    Then status 200
    #And match responseStatus == 200
    #And match response == {"_id":"73dd5420-3bf9-48f3-a0b6-17cf7aa61b19","name":"American Airlines","country":"United States","logo":"https://example.com/logos/american_airlines.png","slogan":"Going for great","head_quaters":"Fort Worth, Texas","website":"https://www.aa.com","established":"1930"}
		#And match $ = {"_id":"73dd5420-3bf9-48f3-a0b6-17cf7aa61b19","name":"American Airlines","country":"United States","logo":"https://example.com/logos/american_airlines.png","slogan":"Going for great","head_quaters":"Fort Worth, Texas","website":"https://www.aa.com","established":"1930"}
		#And match response.country == "United States"
		#And match $.slogan == "Going for great"
		And match response.name contains "Ame"
		#And print responseHeaders
		#And print responseHeaders["Content-Type"][0]
		
	
		Scenario: Get specific airline details base on id without Authentication
    Given url secureBaseURL
    And path 'airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method GET
    Then status 400
		And match $.message == "You must send an Authorization header"
		
		
		Scenario: Get specific airline details base on invalid id 
    Given url secureBaseURL
    And header Authorization = 'Bearer '+authInfo.authToken
    And path 'airlines/73dd5420-3bf9-48f3'
    When method GET
    Then status 204
	
		
		