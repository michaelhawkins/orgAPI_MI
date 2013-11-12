class Organization
  include Mongoid::Document

  attr_accessible :name, :email, :employees_attributes

  has_and_belongs_to_many :employees
  accepts_nested_attributes_for :employees


  field :name, type: String
  field :email, type: String

  validates_presence_of :name, :email

end
