require 'active_model'

class User
  include ActiveModel::Model

  attr_reader :id
  attr_accessor :name

  validates :name, presence: true
end
