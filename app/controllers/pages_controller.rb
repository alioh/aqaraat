class PagesController < ApplicationController
  def home
  	if signed_in?
  		redirect_to properties_path
  	end
  end

  def about
  end
end