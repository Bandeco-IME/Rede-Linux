# Use simplecov and display test on a public page
require 'simplecov'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths.rb"))
require 'capybara'
require 'capybara/cucumber'

SimpleCov.start
SimpleCov.coverage_dir 'public/coverage'

Given(/^that user filled the form properly$/) do 
	fill_in 'pre_signed_user_name', :with=> "Amadeu"
	fill_in 'pre_signed_user_login', :with=> "amadeu"
	click_button 'Enviar'
end

Then(/^user should see "(.?)"$/) do |msg|

end
