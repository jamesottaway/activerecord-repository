require 'active_model'
require 'user/repository'

class User
  include ActiveModel::Model

  attr_reader :id
  attr_accessor :name

  validates :name, presence: true

  def attributes
    { id: self.id, name: self.name }.stringify_keys
  end

  def to_repository
    User::Repository.where(id: self.id).first_or_initialize.tap do |repository|
      repository.assign_attributes(self.attributes)
    end
  end
end
