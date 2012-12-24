class User
  include Mongoid::Document

  field :email
  validates :email, :presence => true, uniqueness: true

  def self.find_or_create_by_email(email)
    where(email: email).first || create(email: email)
  end
end
