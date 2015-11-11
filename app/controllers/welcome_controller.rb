class WelcomeController < ApplicationController
  def index
    @printers = Printer.all
  end
end
