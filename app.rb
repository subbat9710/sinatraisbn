require 'sinatra'
require_relative "isbn.rb"

get '/' do 
   Answer = ""
   erb :isbn_input
end

post '/isbnnum' do 
	num = params[:ISBN]
	pgm_results = validate_input10(num)
	#{}"Isbn number is #{ pgm_results}" #it shows the results
    if pgm_results==true
    Answer = "Valid ISBN is here#{num}"
    else
    Answer = "Invalid ISBN is here#{num}"
    end
  erb :isbn_input 
end