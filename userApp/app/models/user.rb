class User < ActiveRecord::Base
	validates :family_name, presence: true
	validates :name, presence: true
	validates :email, presence: true
	validates :birthday, presence: true
	validates :phone, presence: true
	validates :cellphone, presence: true
	validates :bio, presence: true
	validates :carreer, presence: true
	validates :rate, presence: true, length: {minimum: 0}

	
end
