class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(:first_name)
  end

  def show
  end

  def edit
    @contact = Contact.find(params[:id])

    @months = {
      'January' => '1',
      'February' => '2',
      'March' => '3',
      'April' => '4',
      'May' => '5',
      'June' => '6',
      'July' => '7',
      'August' => '8',
      'September' => '9',
      'October' => '10',
      'November' => '11',
      'December' => '12',
    }
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
