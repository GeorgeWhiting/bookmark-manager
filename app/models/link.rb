require 'data_mapper'
require 'dm-postgres-adapter'

class Link

 # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource
# have a look at the actual data in the tables to work out how through: works
  # tell the class which columns exist in the table
  has n, :tags, through: Resource
  property :id, Serial
  property :title, String
  property :url, String
end
