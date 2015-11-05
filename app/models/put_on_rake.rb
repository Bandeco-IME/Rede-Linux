# Falta colocar no lugar correto-> TASKS
# Talvez seja necessario fazer adaptacoes para ser colocado em tasks

require 'cupsffi'
require 'capybara'
require 'capybara/poltergeist'

include Capybara::DSL
Capybara.default_driver = :poltergeist

class Printer < ActiveRecord::Base


  # DNS for the Cups server:
  cups_server = '192.168.240.15'

  #network_printers = CupsPrinter.get_all_printer_names(:hostname => cups_ser$

  def update_status
    status = CupsPrinter.new(name, :hostname => cups_server).state[:state].to_s
  end

  # is the printer accepting any jobs?
  def accepting_jobs? (name)
    printer = CupsPrinter.new(name, :hostname => cups_server)
    printer.attributes['printer-is-accepting-jobs']
  end

  # state of printer, not really DRY but is mine
  def state (name)
    printer = CupsPrinter.new(name, :hostname => cups_server).state[:state]
  end

  # Obter o status da impressora
  def get_printer_status (name)
  
  	printer = Printer.find_by(name: name)

    if state(name) == :idle or state(name) == :printing

    	if accepting_jobs?(name)
        
        if (name == 'Euclides')
        page.visit "http://euclides/"
        euclides = page.first("span[class='StatusMessage']").text

          if euclides =~ (/error/i)
            page.visit "http://euclides/dstatus.cgi"
            page.click_button("Error Information")  
            euclides = page.all("tbody")[2].text  
            return euclides
          end   

        else 
          if (name == 'Galois')
            page.visit "http://galois/"
            galois = page.all("td[height='26']")[2].text

              if galois =~ (/error/i)
                page.find("input[type$='text']").set '2'
                page.find("a[onclick*='login()']").click
                page.visit "http://galois/dev_error.html"
                galois = page.all("table")[5].all("td")[3].text
                return galois
              end

          else
            puts('Nome de impressora invalido.')
          end

        end #end dos nomes

      else
        puts('Impressora nao esta aceitando trabalhos.')
      end  
  	
    else 
      puts('Impressora nao esta disponivel.')
    end			
  end

end
