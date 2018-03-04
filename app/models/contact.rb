class Contact < ActiveRecord::Base
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    if self.address_line_1.nil?
      ""
    elsif self.address_line_2.present?
      "#{self.address_line_1}, #{self.address_line_2}, #{self.city}, #{self.state} #{self.zip_code}"
    else
      "#{self.address_line_1}, #{self.city}, #{self.state} #{self.zip_code}"
    end
  end
end
