# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/new', type: :view do
  before do
    assign(:booking, Booking.new(
                       user: nil,
                       class_session: nil
                     ))
  end

  it 'renders new booking form' do
    render

    assert_select 'form[action=?][method=?]', bookings_path, 'post' do
      assert_select 'input[name=?]', 'booking[user_id]'

      assert_select 'input[name=?]', 'booking[class_session_id]'
    end
  end
end
