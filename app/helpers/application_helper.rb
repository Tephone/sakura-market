module ApplicationHelper
  def delivery_times_option
    DeliveryTime.all.map { |delivery_time| ["#{delivery_time.start_time}時〜#{delivery_time.end_time}時", delivery_time.id]}.sort_by { |_, delivery_time_id| delivery_time_id}
  end
end
