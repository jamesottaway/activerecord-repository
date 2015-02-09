$LOAD_PATH.unshift __dir__

require 'active_record'
require 'config/database'

include ActiveRecord::Tasks

DatabaseTasks.env = 'arr'
DatabaseTasks.root = __dir__
DatabaseTasks.db_dir = File.join DatabaseTasks.root, 'db'
DatabaseTasks.migrations_paths = [File.join(DatabaseTasks.db_dir, 'migrate')]
DatabaseTasks.database_configuration = DATABASE_CONFIG

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection :arr
end

load 'active_record/railties/databases.rake'
