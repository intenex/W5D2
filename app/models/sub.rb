# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, presence:true, uniqueness:true

  belongs_to :moderator,
    class_name: "User",
      foreign_key: :moderator_id
  has_many :post_subs
  has_many :posts, through: :post_subs, source: :post
end
