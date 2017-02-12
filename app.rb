require 'sinatra'
require_relative "isbn.rb"

get '/' do 

   erb :isbn_input
end

post '/isbnnum' do 
	#num = params['ISBN']
	num = params[:ISBN]
	pgm_results = validate_input10(num)
	"Answer is #{ pgm_results}"
end