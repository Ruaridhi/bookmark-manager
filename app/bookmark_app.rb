require 'sinatra/base'
require './lib/bookmark'

# This is the controller for our Bookmark app
class BookmarkApp < Sinatra::Base
  get '/' do
    erb (:home_page)
  end

  get '/bookmarks' do
    params[:add_bookmark]
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  run! if app_file == $PROGRAM_NAME
end
