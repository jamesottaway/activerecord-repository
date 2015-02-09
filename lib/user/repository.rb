require 'active_record'

class User
  class Repository < ActiveRecord::Base
    self.table_name = 'users'
    validates :name, uniqueness: true
  end
end
