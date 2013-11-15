class Employee
  include Mongoid::Document
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :email, type: String

  attr_accessible :first_name, :middle_name, :last_name, :email, :organizations_attributes, 
    :organization_ids


  validates_presence_of :first_name, :last_name, :email

  has_and_belongs_to_many :organizations, autosave: true

  #accepts_nested_attributes_for needs to come after the relationship 
  #is defined so mongoid can use the metadata
  accepts_nested_attributes_for :organizations

end
