class User < ApplicationRecord
  has_many :traps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          # Deviseのemailバリデーションをオーバーライドして、必須にしない
          #  validates :email, presence: false
          #  validates :password, presence: true, length: { within: 6..128 }, confirmation: true
          #  validates :phone_number, presence: true, uniqueness: true
          #  validate :email_or_phone_number_present            
  
  # Deviseのメールアドレス認証をオーバーライド
  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if (login = conditions.delete(:login))
  #     where(conditions.to_h).where(["lower(phone_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.key?(:phone_number) || conditions.key?(:email)
  #     where(conditions.to_h).first
  # end
# end

 attr_writer :login

 def login
   @login || self.phone_number || self.email
 end

#  class Hunter < User
#    # ハンター固有のメソッドやバリデーション
#  end

#  class Client < User
#    # クライアント固有のメソッドやバリデーション
# end

validates :email, presence: true


private

   def email_or_phone_number_present
     if email.blank? && phone_number.blank?
       errors.add(:base, "メールアドレスか電話番号のどちらかを入力してください")
   end
  end
end