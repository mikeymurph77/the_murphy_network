class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(:first_name)
    session[:index_count] = session[:index_count].present? ? session[:index_count] + 1 : 0
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      flash[:success] = 'Contact Saved!'
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      flash[:success] = 'Contact Saved!'
      redirect_to contacts_path
    else
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :address_line_1, :address_line_2, :city, :state, :zip_code, :birthday_month, :birthday_day)
  end
end
