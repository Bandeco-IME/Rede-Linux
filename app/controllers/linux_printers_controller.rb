class LinuxPrintersController < ApplicationController
  def status
   @status = LinuxPrinter.get_status
  end
end
