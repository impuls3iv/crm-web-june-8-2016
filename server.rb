# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'


get '/' do #calls index page in views directory

  @crm_app_name = "Professional Network Relationship Manager (PNRM)"
  erb :index #serves the html file

end



get '/contacts' do

  erb :contacts

end

get '/new_contact' do

  erb :new_contact

end

post '/contacts' do

  contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]

  )
  redirect to('/contacts')

end

get '/delete_page' do

  erb :delete_page

end

post '/delete_page' do

  Contact.delete(params[:attribute_delete])
  redirect to('/contacts')

end

post '/delete_page_all' do

  Contact.delete_all
  redirect to('/contacts')

end

get '/contacts/:id' do

  @contact = Contact.find(params[:id].to_i) #save instance to @contact
    if @contact #if it exists display single_contact page
      erb :single_contact
    else
      raise Sinatra::NotFound
    end

end


put '/contacts/:id' do #posted from edit_contact.erb

  @contact = Contact.find(params[:id].to_i) #save found contact to @contact
  if @contact #if theres something there

    #pu
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    @contact.save

    redirect to('/contacts')

  else
    raise Sinatra::NotFound
  end
end


#this is called from the single_contact.erb page when the user clicks the edit button
get '/contacts/:id/edit' do

  @contact = Contact.find(params[:id].to_i) #the id is already logged through html
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end

  get '/search' do

    erb :search

  end

end
