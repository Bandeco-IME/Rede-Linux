namespace :printers do

  # Printer class has update_status method, that first checks printer status via
  # the cupsffi gem, then execute code provided to retrieve error message. (Not a
  # DRY way, but the only one to deal with the printers error page interface)
  
  task update_euclides_status: :environment do    
    # Retrieve a Printer object from the db by name:
    euclides = Printer.find_by(name: 'Euclides')
    
    # Update its status (with Capybara code to retrieve error messages):
    euclides.update_status do
      page.visit self.url
      status_msg = page.first("span[class='StatusMessage']").text

      if status_msg =~ (/error/i)
        page.visit self.url << self.error_url
        page.click_button("Error Information")
        new_status = page.all("tbody")[2].text
      end   
    end
    
  end
  
  task update_galois_status: :environment do
    galois = Printer.find_by(name: 'Galois')
    
    galois.update_status do
      page.visit self.url
      status_msg = page.all("td[height='26']")[2].text

      if status_msg =~ (/error/i)
        page.find("input[type$='text']").set '2'
        page.find("a[onclick*='login()']").click
        page.visit self.url << self.error_url
        new_status = page.all("table")[5].all("td")[3].text                
      end      
    end

  end
  
end
