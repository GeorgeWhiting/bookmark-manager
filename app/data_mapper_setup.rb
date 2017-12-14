require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'

# Now let's set up a connection with a database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
#DataMapper.auto_upgrade!
