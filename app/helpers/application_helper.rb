module ApplicationHelper
  def delivery_times_option
    DeliveryTime.all.map { |delivery_time|
      ["#{delivery_time.start_time}時〜#{delivery_time.end_time}時", delivery_time.id]
    }.sort_by { |_, delivery_time_id| delivery_time_id }
  end

  def order_total_price(cart_items_price, send_fee, cod_charge)
    if CartItem.un_ordered.present?
      "合計金額: #{((send_fee + cod_charge + cart_items_price).* 1.1).to_i}円
      ( 商品合計: #{cart_items_price}円, 送料: #{send_fee}円, 代引き手数料: #{cod_charge}円 + 消費税 )"
    end
  end

  def max_delivery_date
    start_date = Date.current.since(3.days).to_date
    end_date = Date.current.since(14.days).to_date
    dates = (start_date..end_date).to_a
    extra = 0
    dates.each do |date|
      if date.wday == 0 || date.wday == 6
        extra += 1
      end
    end
    end_date.since(extra.days)
  end

  def separate_coupon(code)
    code.scan(/.{4}/).join('-')
  end
end
