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
  def self.find_by(att_find_by, val_find_by)

    # #get user input
    # puts "Do you want to search by first name (first), last name (last), email (email), or notes (note)?"
    # att_find_by = gets.chomp!
    # puts "What is the value of that attribute? (jon? sam@email.com? \'cool dude\'?)"
    # val_find_by = gets.chomp!

    #find the value
    if att_find_by == "first_name"
      @@contacts.each do |findby|
        if findby.first_name == val_find_by
          #return findby
          return findby#{}"ID: #{findby.id} Contains first name #{findby.first_name}, last name #{findby.last_name}, email #{findby.email}, note: #{findby.note}"
        end
      end

    elsif att_find_by == "last_name"
      @@contacts.each do |findby|
        if findby.last_name == val_find_by
          return findby#{}"ID: #{findby.id} Contains first name #{findby.first_name}, last name #{findby.last_name}, email #{findby.email}, note: #{findby.note}"
        end
      end

    elsif att_find_by == "email"
      @@contacts.each do |findby|
        if findby.email == val_find_by
          return findby#{}"ID: #{findby.id} Contains first name #{findby.first_name}, last name #{findby.last_name}, email #{findby.email}, note: #{findby.note}"
        end
      end

    elsif att_find_by == "note"
      @@contacts.each do |findby|
        if findby.note == val_find_by
          return findby#{}"ID: #{findby.id} Contains first name #{findby.first_name}, last name #{findby.last_name}, email #{findby.email}, note: #{findby.note}"
        end
      end

    end

  end




  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(att_update, att_value)

    # puts "Which attribute do you want up update? (first, last, email or note)"
    # att_update = gets.chomp!
    # puts "What is the new value"
    # att_value = gets.chomp!

    if att_update == "first"
      @first_name = att_value
    elsif att_update == "last"
      @last_name = att_value
    elsif att_update == "email"
      @email = att_value
    elsif att_update == "note"
      @note = att_value
    end



  end


  # This method should delete all of the contacts
  def self.delete_all

    # for contact_delete in 0..@@contacts.length
      #@@contacts.delete_at(contact_delete)
      @@contacts = []
    #end

  end

  def full_name

    #return @contact
    return "#{@first_name} #{@last_name}"

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(delete_id)#(delete_id)

    delete_var = delete_id.to_i #do i need to do this? who knows...
    @@contacts.each do |item| #iterate over each instance of contact in the master array
        if item.id == delete_var #cif there is an item id thats the same as user inputted delete_var
          temp_var = @@contacts.index(item) #save the index number of the @@contact instance with the id
          @@contacts.delete_at(temp_var) #and delete the array item at that index number
        end
    end
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
  end

  # Feel free to add other methods here, if you need them.

end

#
# jon = Contact.create('jon', 'doe', 'jon@sam.com', 'note22222')
# sam = Contact.create('sam', 'unt', 'sam@sam.com', 'note1')
# jane = Contact.create('jane', 'smith', 'jane@gmail.com', 'sooo cool')
