Feature: Printers at home page
    In order to print something
    A visitor
    Should see the printer status at home page

    Scenario: Check printers at home
        Given that we have "Euclides" at the database
        And I am on the home page
        Then I should see "Euclides"        
    