class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :city, :address, :building_name, :tel_num, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 0 } 
    validates :city
    validates :address
    validates :tel_num, format: { with: /\A\d{11}\z/}
  end


  

  def save
    # 注文情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, tel_num: tel_num, order_id: order.id)
    
    
  end

end
