# frozen_string_literal: true

class User < ApplicationRecord
  include AccountOwnable
  after_initialize :set_default_role, :set_default_plan, if: :new_record?
  devise :masqueradable, :database_authenticatable, :confirmable, :registerable, :trackable, :recoverable,
         :rememberable, :validatable, :omniauthable
  # Roles, add other roles as required
  enum role: {
    user: 0,
    member: 1
  }, _prefix: true

  # Plans
  enum plan: {
    free: 0,
    standard: 1,
    turbo: 2
  }, _prefix: true

  # Validations, Names, Avatars
  validates :email, presence: true
  validates :email, uniqueness: true
  # validates :username, presence: true
  has_one_attached :avatar
  has_person_name
  # Notifications & Services
  has_many :notifications, as: :recipient
  has_many :services
  has_many :projects
  # Methods
  def set_default_role
    self.role ||= :user
  end

  def set_default_plan
    self.plan ||= :free
  end
  end
