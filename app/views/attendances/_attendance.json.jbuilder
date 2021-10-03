json.extract! attendance, :id, :email, :full_name, :uid, :avatar_url, :index_admins_on_email, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
