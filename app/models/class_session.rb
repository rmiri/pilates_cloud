# frozen_string_literal: true

class ClassSession < ApplicationRecord
  belongs_to :studio
  belongs_to :user
end
