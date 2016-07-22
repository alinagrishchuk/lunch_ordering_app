require 'rails_helper'

describe 'Authentication', :type => :request do
  subject { page }

  describe 'sign in' do
    before { visit  root_path }

    it { should have_content('Log in') }
    it { should_not have_link('Sign out', href: destroy_user_session_path) }

    describe 'with invalid information' do
      before { click_button 'Log in' }
      it { should have_content('Invalid') }
    end

    describe 'with valid information' do
      let!(:user) { create(:user) }
      before { valid_signin user }
    end
  end

  describe 'sign up' do
    before { visit  root_path }

    describe 'with invalid information' do
      before { click_button 'Sign up' }
      it { should have_content('Name can\'t be blank') }
    end

    describe 'with valid information' do
      it 'should create user & sign in' do
        within '#sign-up' do
          fill_in 'Name',                   with: 'Jon Smith'
          fill_in 'Email',                  with: 'email@example.com'
          fill_in 'Password',               with: 'foobar123'
          fill_in 'Password confirmation',  with: 'foobar123'
          click_button 'Sign up'
        end
        should have_content('Welcome!')
      end
    end
  end
end