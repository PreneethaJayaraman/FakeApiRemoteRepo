Feature:
   
  @Auth
  Scenario: Dummy user authentication
  Given header Content-Type = 'application/x-www-form-urlencoded; charset=utf-8'
  And form field scope = SCOPE
  And form field grant_type = GRANT_TYPE
  And form field username = USER_NAME
  And form field password = PASSWORD
  And form field client_id = CLIENT_ID
  And url AUTHURI
  When method POST
  Then status 200
  *	def access_token = response.access_token
  
 