# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/show', type: :view do
  before do
    assign(:booking, Booking.create!(
                       user: nil,
                       class_session: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
