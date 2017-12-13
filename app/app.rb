ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(url: params[:addlink], title: params[:link_name])
    tag = Tag.first_or_create(name: params[:tag])
    link.tag << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0

end
