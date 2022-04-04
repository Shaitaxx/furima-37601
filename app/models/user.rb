class User < ApplicationRecord
  has_many :goods
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
