class User < ApplicationRecord
	rolify
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable

	validates :first_name, presence: true

	validates :last_name, presence: true

	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, :timeoutable

	has_attached_file :photo, styles: { small: "64x64", medium: "94x95", large: "200x200"}
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	after_create :assign_role

	def assign_role
		if self.email.eql?("admin@admin.com")
			add_role(:admin)
		else
			add_role(:user)
		end
	end
end
