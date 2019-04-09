# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  content           :text             not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer          not null
#

class Comment < ApplicationRecord
  validates :content, presence: true 
  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id
  belongs_to :post
end
