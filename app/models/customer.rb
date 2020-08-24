class Customer < ApplicationRecord
    has_secure_password
    has_many :customer_items
    has_many :items, through: :customer_items
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 


    def create_method(session)
        if self.save
            session[:user_id] = self.id
            else
             false
            end
          end
end
