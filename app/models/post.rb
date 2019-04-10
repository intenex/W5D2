# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id
  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub
  has_many :comments
  
  def comments_by_parent_id
    id_hash = Hash.new {|h,k| h[k] = []}

    comments.each do |comment|
      id_hash[comment.parent_comment_id] << comment
    end
    return id_hash
  end

end
