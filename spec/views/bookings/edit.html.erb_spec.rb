# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookings/edit', type: :view do
  let(:booking) do
    Booking.create!(
      user: nil,
      class_session: nil
    )
  end

  before do
    assign(:booking, booking)
  end

  it 'renders the edit booking form' do
    render

    assert_select 'form[action=?][method=?]', booking_path(booking), 'post' do
      assert_select 'input[name=?]', 'booking[user_id]'

      assert_select 'input[name=?]', 'booking[class_session_id]'
    end
  end
end
