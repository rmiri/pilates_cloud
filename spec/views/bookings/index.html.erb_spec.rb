# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/index', type: :view do
  before do
    assign(:bookings, [
             Booking.create!(
               user: nil,
               class_session: nil
             ),
             Booking.create!(
               user: nil,
               class_session: nil
             )
           ])
  end

  it 'renders a list of bookings' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
