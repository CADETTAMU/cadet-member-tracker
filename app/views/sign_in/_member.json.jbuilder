json.extract! member, :email, :full_name, :uid, :avatar_url, :is_admin, :created_at, :updated_at
json.url member_url(member, format: :json)
