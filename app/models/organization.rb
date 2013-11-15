class Organization
  include Mongoid::Document

  attr_accessible :name, :email, :employees_attributes, :employee_ids

  has_and_belongs_to_many :employees, autosave: true
  accepts_nested_attributes_for :employees


  field :name, type: String
  field :email, type: String

  validates_presence_of :name, :email

end
