# Use simplecov
require 'simplecov'
SimpleCov.start

require 'capybara'
require 'capybara/poltergeist'
require 'capybara/cucumber'

Capybara.default_driver = :poltergeist

Given(/^that we have "(.*?)" at the database$/) do |printer_name|
  Printer.create(name: printer_name, status: "Undefined", url: "http://#{printer_name}/", error_url: "dstatus.cgi")
end

Given(/^I am on the home page$/) do
  page.visit root_path
  expect(page.has_content?).to be true
end

Then(/^I should see "(.*?)"$/) do |s|
  expect(page.has_content? s).to be true
end

Then(/^I should not see "(.*?)"$/) do |s|
  expect(page.has_content? s).to be false
end
