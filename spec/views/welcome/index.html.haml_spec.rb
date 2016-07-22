require 'rails_helper'

RSpec.describe "welcome/index.html.haml", type: :view do
  it 'displays authorization block correctly' do
    render
    expect(rendered).to have_content('Welcome to Lunch Ordering application!')
    expect(rendered).to have_content('Sign up')
    expect(rendered).to have_content('Log in')
  end
end
