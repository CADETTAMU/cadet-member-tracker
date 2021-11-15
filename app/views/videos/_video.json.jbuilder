# frozen_string_literal: true

json.extract! video, :id, :publish_date, :title, :uploader, :created_at, :updated_at
json.url video_url(video, format: :json)
