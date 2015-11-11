Feature: New pre-signed-up user
	In order to sign up
	A user
	Should see the subscribe form
	
	Scenario: New User
		Given that user filled the form properly
		Then user should see "Você completou seu pré-cadastro"  
