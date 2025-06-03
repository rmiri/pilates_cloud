# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[platform_admin studio_admin instructor member].freeze

  def platform_admin?
    role == 'platform_admin'
  end

  def studio_admin?
    role == 'studio_admin'
  end

  def instructor?
    role == 'instructor'
  end

  def member?
    role == 'member'
  end
end
