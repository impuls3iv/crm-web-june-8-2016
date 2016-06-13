# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'CRM_web.sqlite3')

class Contact < ActiveRecord::Base

#-------------------------------
#creates field with symbol as column name, as as key, and datatype
  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note,  as: :text
#dont need an id field because sqlite creates field for you
#----------------------------------

  def full_name

    #return @contact
    return "#{ @first_name } #{ @last_name }"

  end


end

Contact.auto_upgrade! # saves table design. does not save data
#is useful if the table is modified. It will always insure that the table schema-
# -is up to date
