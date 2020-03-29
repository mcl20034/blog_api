# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "CRUD Article" do
    it "create Article" do
      article = Article.create(title: 'title', content: 'content')
      expect(article.title).to eq('title') 
    end
  end
  
end
