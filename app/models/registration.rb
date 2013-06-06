class Registration
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :email, :name, :status

  field :email, type: String
  field :name, type: String
  field :status, type: String, default: 'new'

  validates :name, presence: true
  validates :email, :presence => true, uniqueness: true, format: {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }

  def confirmed?
    status == 'confirmed'
  end
end
