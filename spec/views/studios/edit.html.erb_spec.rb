# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studios/edit', type: :view do
  let(:studio) do
    Studio.create!(
      name: 'MyString',
      description: 'MyText'
    )
  end

  before do
    assign(:studio, studio)
  end

  it 'renders the edit studio form' do
    render

    assert_select 'form[action=?][method=?]', studio_path(studio), 'post' do
      assert_select 'input[name=?]', 'studio[name]'

      assert_select 'textarea[name=?]', 'studio[description]'
    end
  end
end
