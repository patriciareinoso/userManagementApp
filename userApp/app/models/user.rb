# Includes the validations of attributes on the
# classes
# 
# Author:: Patricia Reinoso


# Class for attribute validation on an User.
# * family name and name only allow letters and spaces and
# * their max length is 50
# * email format is validated (eg. email@domain.xx )
# * birthday can not be in the future
# * bio and carrer allow maximum 300 characters.
# * rate must be non negative
# * family_name, name, emails, birthday, cellphone, rate cannot be null.
# * Formats allowed for phone and cellphone are:
# * 0612345678, 06 12 34 56 78, +33 6 12 34 56 78, +33612345678
# * Only aread code +33 is valid.
class User < ActiveRecord::Base

	validates :family_name, presence: true, 
							format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" },
							length: { maximum: 50, too_long: "%{count} characters is the maximum allowed"}
	validates :name, presence: true, 
					 format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" },
					 length: { maximum: 50, too_long: "%{count} characters is the maximum allowed"}
	validates :email, presence: true,
					  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "invalid format" }
	validates :birthday, presence: true
	validate :birthday_cannot_be_in_the_future
	validates :phone, format: { with: /\A^0\d(?:\d{8}|(?: \d\d){4})|\+33 0\d(?: \d\d){4}|\+33(?:\d{9})$\z/}
	validates :cellphone, presence: true,
						  format: { with: /\A^0\d(?:\d{8}|(?: \d\d){4})|\+33 0\d(?: \d\d){4}|\+33(?:\d{9})$\z/}
	validates :bio, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
	validates :career, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
	validates :rate, presence: true, numericality:{ :greater_than_or_equal_to => 0}

	

	def birthday_cannot_be_in_the_future
		if birthday.present? && birthday > Date.today
			errors.add(:birthday, "invalid")
		end
	end
end
