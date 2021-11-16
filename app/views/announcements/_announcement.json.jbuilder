json.extract! announcement, :id, :author_announce, :publish_date, :title, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
