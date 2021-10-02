json.extract! announcement, :id, :publish_id, :author, :publish_date, :title, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
