# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studios/new', type: :view do
  before do
    assign(:studio, Studio.new(
                      name: 'MyString',
                      description: 'MyText'
                    ))
  end

  it 'renders new studio form' do
    render

    assert_select 'form[action=?][method=?]', studios_path, 'post' do
      assert_select 'input[name=?]', 'studio[name]'

      assert_select 'textarea[name=?]', 'studio[description]'
    end
  end
end
