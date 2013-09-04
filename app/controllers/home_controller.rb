class HomeController < ApplicationController
  def welcome
  	add_breadcrumb "Home", :root_path
  end
end
