# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studios/index', type: :view do
  before do
    assign(:studios, [
             Studio.create!(
               name: 'Name',
               description: 'MyText'
             ),
             Studio.create!(
               name: 'Name',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of studios' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
