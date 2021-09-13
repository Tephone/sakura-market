module ApplicationHelper
  def delivery_times_option
    DeliveryTime.order(:id).map { |delivery_time|
      ["#{delivery_time.start_time}時〜#{delivery_time.end_time}時", delivery_time.id]
    }
  end

  def sellers_option
    Seller.default_order.map { |seller| [seller.name, seller.id] }
  end

  def order_total_price(cart_items_price, send_fee, cod_charge)
    "合計金額: #{((send_fee + cod_charge + cart_items_price).* 1.1).to_i}円
    ( 商品合計: #{cart_items_price}円, 送料: #{send_fee}円, 代引き手数料: #{cod_charge}円 + 消費税 )"
  end

  def max_delivery_date
    start_date = Date.current.since(3.days).to_date
    end_date = Date.current.since(14.days).to_date
    dates = (start_date..end_date)
    extra = 0
    dates.each do |date|
      if date.saturday? || date.sunday?
        extra += 1
      end
    end
    end_date.since(extra.days)
  end

  def separate_coupon(code)
    code.scan(/.{4}/).join('-')
  end

  def change_JPY(num)
    number_to_currency(num, unit: '円')
  end

  def get_coupon_rate(coupon)
    if coupon.get_coupons.count.zero? || User.count.zero?
      '利用者はいません'
    else
      "#{(coupon.get_coupons.count / User.count.to_f * 100).to_i}%"
    end
  end
end
