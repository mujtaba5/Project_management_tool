# frozen_string_literal: true

class Project < ApplicationRecord
  include AccountOwnable
  belongs_to :user
end
