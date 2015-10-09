require 'capybara'
require 'capybara/poltergeist'
include Capybara::DSL
Capybara.default_driver = :poltergeist

class LinuxPrinter < ActiveRecord::Base

  def self.get_status
    visit "http://euclides/"
    euclides = page.first("span[class='StatusMessage']").text

    if euclides =~ (/error/i)
      visit "http://euclides/dstatus.cgi"
      page.click_button("Error Information")
      euclides = page.all("tbody")[2].text

    end

    visit "http://galois/"
    galois = page.all("td[height='26']")[2].text

    if galois =~ (/error/i)
      find("input[type$='text']").set '2'
      find("a[onclick*='login()']").click
      visit "http://galois/dev_error.html"
      galois = all("table")[5].all("td")[3].text
    end
    return {euclides: euclides, galois: galois}
  end

end
