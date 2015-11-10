# Use simplecov and display test on a public page
require 'simplecov'
SimpleCov.start
SimpleCov.coverage_dir 'public/coverage'

require 'capybara' 
require 'capybara/cucumber'

Given(/^that user filled the form properly$/) do 
	fill_in 'pre_signed_user_name', with: "Amadeu"
	fill_in 'input#login', with: 'amadeugay'
end

Then(/^user should see "(.?)"$/) do |msg|

end
