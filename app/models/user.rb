class User < ApplicationRecord
    #Validations
   validates_presence_of :name ,:surname,:username, :email, :password_digest
   validates :email, uniqueness: true
   validates :user_type, presence: true

   enum user_type: ['user', 'admin', 'facilityOwner', 'facilityManager']
   #encrypt password
   has_secure_password
end
