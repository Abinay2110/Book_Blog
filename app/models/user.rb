class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :bviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

		 
	def roles?(role)
		roles.include? role.to_s
	end

end
