class User < ApplicationRecord
   def create
     has_secure_password
     validates :email, presence: true, uniqueness: true 
   end
end
