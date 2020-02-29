class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :likes, :dependent => :destroy
  has_many :liked_posts, :through => :likes, :source => :post

  has_many :collects, :dependent => :destroy
  has_many :collected_posts, :through => :collects, :source => :post

  def display_name
    #取email的前半段顯示，或另開一個字段nickname讓用戶自己編輯顯示名稱
    self.email.split("@").first
  end

  def is_fan_of?(post)
    collected_posts.include?(post)
  end

end
