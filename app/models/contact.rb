class Contact < ActiveRecord::Base
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def readable_phone
    return if self.phone.blank?
    self.phone.insert(-8, '-').insert(-5, '-')
  end

  def full_address
    if self.address_line_1.blank?
      ""
    elsif self.address_line_2.present?
      "#{self.address_line_1}, #{self.address_line_2}, #{self.city}, #{self.state} #{self.zip_code}"
    else
      "#{self.address_line_1}, #{self.city}, #{self.state} #{self.zip_code}"
    end
  end
end
