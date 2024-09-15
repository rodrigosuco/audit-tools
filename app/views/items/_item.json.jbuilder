json.extract! item, :id, :standard_id, :stage, :year, :onsite_man_days, :off_site_man_days, :man_day_rate, :total_cost, :created_at, :updated_at
json.url item_url(item, format: :json)
