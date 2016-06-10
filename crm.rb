# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'


Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')

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

  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
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

  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :single_contact
    else
      raise Sinatra::NotFound
    end

end

get '/contacts/:id/edit' do

  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
  
end
