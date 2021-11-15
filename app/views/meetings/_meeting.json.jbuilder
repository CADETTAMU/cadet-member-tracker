# frozen_string_literal: true

json.extract! meeting, :id, :Name, :Number, :StartTime, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
