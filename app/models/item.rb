class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :day
  belongs_to :shipping
  belongs_to :state
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
    with_options numericality: { other_than: 1 }  do
      validates :category_id
      validates :state_id
      validates :shipping_id
      validates :area_id
      validates :day_id
    end
  end

end
