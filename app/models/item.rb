class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :day
  belongs_to :shipping
  belongs_to :state

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :state_id
  validates :shipping_id
  validates :area_id
  validates :day_id
  end
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
