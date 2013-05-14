class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  validates :email, :presence => true, uniqueness: true, format: {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }

  def self.find_or_create_by_email(email)
    where(email: email).first || create(email: email)
  end
end
