# Use simplecov and display test on a public page
require 'simplecov'
SimpleCov.start
SimpleCov.coverage_dir 'public/coverage'

require 'capybara'
require 'capybara/poltergeist'
require 'capybara/cucumber'

Capybara.default_driver = :poltergeist

Given(/^that we have "(.*?)" with status "(.*?)"at the database$/) do |printer, status|
  Printer.create(name: printer, status: status, url: "http://#{printer}/", error_url: "dstatus.cgi")
end

Given(/^I am on the home page$/) do
  page.visit root_path
  expect(page.has_content?).to be true
end

Then(/^I should see "(.*?)"$/) do |s|
  expect(page).to have_content s
end

Then(/^I should not see "(.*?)"$/) do |s|
  expect(page).to have_no_content s
end

Then(/^I should see "(.*?)" as "(.*?)" status$/) do |status, printer|
  tr_selector = 'tr#' << printer
  expect(page).to have_css(tr_selector, text: status)
end

