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



  # This method should accept an id as an argument
  # and return the contact who has that id


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty





  # This method should delete all of the contacts


  def full_name

    #return @contact
    return "#{@first_name} #{@last_name}"

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here

    #@@contacts.delete(self)
    # delete_var = delete_id.to_i #do i need to do this? who knows...
    # @@contacts.each do |item| #iterate over each instance of contact in the master array
    #     if item.id == delete_var #cif there is an item id thats the same as user inputted delete_var
    #       temp_var = @@contacts.index(item) #save the index number of the @@contact instance with the id
    #       @@contacts.delete_at(temp_var) #and delete the array item at that index number
    #     end

        # puts "#{temp_var}"



      # var = @@contacts
      # puts @@contact(contact_delete)
      # @@contacts.delete_at(contact_delete)

    #end

  # Feel free to add other methods here, if you need them.

end

#
# jon = Contact.create('jon', 'doe', 'jon@sam.com', 'note22222')
# sam = Contact.create('sam', 'unt', 'sam@sam.com', 'note1')
# jane = Contact.create('jane', 'smith', 'jane@gmail.com', 'sooo cool')
