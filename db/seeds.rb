require 'csv'

csv_text = File.read(Rails.root.join('murph-fam.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  person_data = row.to_hash

  first_name, last_name = person_data['Name'].split(' ')
  phone = person_data['Primary Phone #'].try(:tr, '^0-9', '')

  Contact.create(
    first_name: first_name,
    last_name: last_name,
    phone: phone,
    email: person_data['Email'],
    address_line_1: person_data['Address'],
    address_line_2: person_data['Address2'],
    city: person_data['City'],
    zip_code: person_data['Zip'],
    state: person_data['State'],
    birthday_month: nil,
    birthday_day: nil
  )
end
