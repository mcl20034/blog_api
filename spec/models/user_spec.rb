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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
