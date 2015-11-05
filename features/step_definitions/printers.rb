require 'capybara'
require 'capybara/poltergeist'
require 'capybara/cucumber'

Capybara.default_driver = :poltergeist

Given(/^that I am on the home page$/) do
  page.visit "http://sas.linux.ime.usp.br:3000"
  expect(page.has_content?).to be true
end

Then(/^I should see "(.*?)"$/) do |s|
  expect(page.has_content? s).to be true
end

Then(/^I should not see "(.*?)"$/) do |s|
  expect(page.has_content? s).to be false
end