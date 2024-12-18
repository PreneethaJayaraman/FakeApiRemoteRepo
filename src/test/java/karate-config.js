function fn() {
	var env = karate.env; // get system property 'karate.env'
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'dev';
	}
	var config = {
		env: env,
		
		AUTHURI: 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token',
		nonSecureBaseURL: 'https://api.instantwebtools.net/v1',
		secureBaseURL: 'https://api.instantwebtools.net/v2',
		SCOPE: 'offline_access',
		GRANT_TYPE: 'password',
		USER_NAME: 'api-user2@iwt.net',
		PASSWORD: 'b3z0nV0cLO',
		CLIENT_ID: '0oahdhjkutaGcIK2M4x6',
	}

	var result = karate.callSingle('classpath:Authentication/Authentication.feature',config);
	
	
	config.authInfo = { 
		authTime: result.time, authToken: result.access_token 
	};   
	  
	console.log(config.authInfo.authToken);
	karate.log(config.authInfo.authToken);
	if (env == 'dev') {
	} else if (env == 'production') {
		
	}
	return config;
}