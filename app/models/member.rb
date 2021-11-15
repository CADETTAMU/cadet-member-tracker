# frozen_string_literal: true

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:, is_admin:)
    return nil unless email =~ /((tamucadetwebsite@gmail.com)$)|@(((email\.)?tamu\.edu)|([Aa]ggie[Nn]etwork\.com))$/

    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url,
                is_admin: is_admin).find_or_create_by!(email: email)
  end
end
