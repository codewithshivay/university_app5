class Student < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { minimum: 5, maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	validates :email, presence: true,
 	                     uniqueness: { case_sensitive: false }, 
 	                     length: { maximum: 100 },
 	                     format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	has_many :student_courses
	has_many :courses, through: :student_courses
	has_one_attached :profile
	has_many :reviews
end