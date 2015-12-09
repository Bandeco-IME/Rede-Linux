
Feature: New pre-signed-up user
	In order to sign up
	The future user 
	Should see the subscribe form
	
	Scenario: New User to pre-signup
		Given I am on the pre-signup home page 
		When I follow "Cadastro de Novo Usuário"
		Then I sould be on the pre_ signed_ users/new page
		When I fill in "Nome" with "Amadeu S."
		And I fill in "Número USP" with "7993828"
		And I fill in "Login" with "amadeush"
		And I fill in "email" with "amadeu@email.com"
		And I fill in "Senha" with "batata"
		And I fill in "Senha (confirmação)" with "batata"
		Then user should see "amadeu, seu pré cadastro foi realizado com sucesso! Favor comparecer a sala de administração da rede para finalizar seu cadastro."  
			
