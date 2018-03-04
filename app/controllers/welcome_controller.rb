class WelcomeController < ApplicationController
  def check
    if params[:city_check].try(:downcase).include? 'quincy'
      flash[:success] = 'Welcome!'
      session[:verified] = true
      redirect_to contacts_path
    else
      flash[:error] = 'Oops, your answer is not correct. Try again...'
      redirect_to root_path
    end
  end
end
