json.extract! attendance, :name, :email, :attended_at, :meeting_number
json.url attendance_url(attendance, format: :json)
