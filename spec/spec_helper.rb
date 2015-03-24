require 'active_model'
require 'active_record'

$LOAD_PATH << File.join(__dir__, '..')
require 'config/database'

ActiveRecord::Base.configurations = DATABASE_CONFIG
ActiveRecord::Base.establish_connection :arr

require 'user/repository'
User::Repository.connection

require 'rspec/its'
require 'rspec/the'
require 'shoulda-matchers'
require 'pry'
