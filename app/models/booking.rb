# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :class_session
end
