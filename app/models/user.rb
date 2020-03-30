# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  activated            :datetime
#  admin                :boolean          default(FALSE)
#  authentication_token :string
#  email                :string
#  name                 :string
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :User do
    key :required, [:id, :name]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :name do
      key :type, :string
    end
    property :email do
      key :type, :string
    end
  end

  has_secure_password
  validates :email, uniqueness: true
  
  def token
    Token.encode(user_id: self.id)
  end

  def to_json
    self.slice(:name, :email)
  end

end
