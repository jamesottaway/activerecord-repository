require 'active_record'
require 'user'

class User
  class Repository < ActiveRecord::Base
    self.table_name = 'users'
    validates :name, uniqueness: true

    def to_model
      User.new(self.attributes.except('id')).tap do |user|
        user.instance_variable_set :@id, self.id
      end
    end
  end
end
