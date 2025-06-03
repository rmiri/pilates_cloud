# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with a valid email and password" do
      user = User.new(email: "test@example.com", password: "password")
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = User.new(password: "password")
      expect(user).not_to be_valid
    end

    it "is invalid without a password" do
      user = User.new(email: "test@example.com")
      expect(user).not_to be_valid
    end
  end

  describe "roles" do
    let(:roles) { User::ROLES }

    it "defaults to role" do
      roles.each do |user_role|
        user = User.create(email: "mail@example.com", password: "password", role: user_role)
        expect(user.role).to eq(user_role)
      end
    end
  end
end
