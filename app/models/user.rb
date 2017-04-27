class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :star_relationships
  has_many :starred_jobs, :through => :star_relationships, :source => :job

  def admin?
    is_admin
  end

  def is_follower_of?(job)
    starred_jobs.include?(job)
  end

end
