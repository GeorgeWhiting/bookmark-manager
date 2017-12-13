require 'data_mapper'
require 'dm-postgres-adapter'

class Link

 # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # tell the class which columns exist in the table
  has n, :tag, through: Resource
  property :id, Serial
  property :title, String
  property :url, String
end
