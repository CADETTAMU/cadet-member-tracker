class User < ApplicationRecord

	enum role: [:member, :admin]

	after_initialize do 
		if self.new_record?
			self.role ||= :member
		end
	end
end