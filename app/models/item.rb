class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge_bearer
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_untill_shipping

  belongs_to :user
  #  モデルやテーブル未作成のため後ほど has_one :purchase

  has_one_attached :image
  
   
 with_options presence: true do 
  validates :name
  validates :explanation
  validates :category_id,                     numericality: { other_than: 0 }
  validates :condition_id,                    numericality: { other_than: 0 }
  validates :shipping_charge_bearer_id,       numericality: { other_than: 0 }
  validates :shipping_area_id,                numericality: { other_than: 0 }
  validates :days_untill_shipping_id,         numericality: { other_than: 0 }
  validates :price,                           numericality: { only_ineger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :user
 end


 
end
