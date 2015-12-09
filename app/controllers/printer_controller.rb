class PrinterController < ApplicationController
  def status
    @printers = Printer.all
  end
end
