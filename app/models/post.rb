# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author     :string
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :author, :title, :content, presence: :true
  validates :title, length: {in:5...50}
    validates :content, length: {in:5...500}
    has_many :comments
end
