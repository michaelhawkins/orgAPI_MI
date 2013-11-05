class Organization
  include Mongoid::Document

  attr_accessible :name, :email

  field :name, type: String
  field :email, type: String

  validates_presence_of :name, :email
end
