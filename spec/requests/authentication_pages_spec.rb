require 'rails_helper'

describe 'authentication & authorization', :type => :request do
  subject { page }
  let(:title) { "Welcome to Lunch Ordering application!"}

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

  describe 'routing for different roles' do
    describe 'with unauthorized user' do
      before do
        visit '/'
      end
      it 'should display authentication page' do
        should have_content title
      end
    end

    describe 'with authorized user' do
      before do
        login_as(create(:user), :scope => :user)
        visit '/'
      end
      it 'should display authentication page' do
        should have_selector('div.menus-calendar #calendar')
      end
    end

    describe 'with authorized admin' do
      before do
        login_as(create(:admin), :scope => :user)
        visit '/'
      end
      it 'should display authentication page' do
        should have_content 'Users'
      end
    end

  end
end