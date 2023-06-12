class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id}
  belongs_to :user
end
