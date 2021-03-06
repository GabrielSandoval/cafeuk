class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :confirmable,
  #        :recoverable, :rememberable, :trackable, :validatable, :lockable

  devise :database_authenticatable, :registerable,
  		 :rememberable, :trackable, :validatable

  has_many :reservations, :dependent => :destroy
  has_many :carts, :dependent => :destroy
  has_many :feedbacks, :dependent=> :destroy

end
