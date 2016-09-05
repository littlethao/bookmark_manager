require 'sinatra'
require_relative './model/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Links"
  end

  get '/links' do
    @links = Link.all
    erb :index
  end

  # start the server if ruby file executed directly
   run! if app_file == $0

end
