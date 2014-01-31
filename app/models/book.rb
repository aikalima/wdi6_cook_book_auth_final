# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  cuisine    :string(255)
#  chef       :string(255)
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer

class Book < ActiveRecord::Base
  has_many :recipes
  belongs_to :user
end
