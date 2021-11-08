module OmniauthMacros
    def mock_auth_hash
      # The mock_auth configuration allows you to set per-provider (or default)
      # authentication hashes to return during integration testing.
      OmniAuth.config.mock_auth[:google] = {
        'email' => 'tamucadetwebsite@gmail.com',
        'uid' => '123545',
        'created_at' => '2013-12-05 14:42:20 UTC',
        'avatar_url' => 'whateves',
        'is_admin' => 'true',
        'updated_at' => '2013-12-05 14:42:20 UTC'
      }
    end
  end
