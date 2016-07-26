ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:'/links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    tag = Tag.first_or_create(:name => params[:tags])
    link.tags << tag
    link.save
    tag.links << link
    tag.save
    redirect '/links'
  end

 get '/tags/bubbles' do
   @links = Link.all
   erb(:'tags/filtered')
 end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
