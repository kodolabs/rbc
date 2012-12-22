class User
  include Mongoid::Document

  field :email
  validates :email, :presence => true

end
