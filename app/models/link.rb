require 'data_mapper'
require 'dm-postgres-adapter'

class Link

 # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # tell the class which columns exist in the table

  property :id, Serial
  property :title, String
  property :url, String

end
# Now let's set up a connection with a database
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
