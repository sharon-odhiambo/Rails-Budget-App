require 'rails_helper'

RSpec.describe 'Feature User login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'Add category' do
    user = User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password',
                       password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add a new category'

    expect(page).to have_current_path('/groups/new')
  end

  it 'Presence of Add category select field' do
    user = User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password',
                       password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add a new category'

    expect(page).to have_content('Icon')
  end

  it 'Presence of Add category name field' do
    user = User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password',
                       password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add a new category'

    expect(page).to have_content('Name')
  end

  it 'Presence of Add category button submit field' do
    user = User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password',
                       password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add a new category'

    expect(page).to have_button('Add')
  end

  it 'Add a category to the list' do
    user = User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password',
                       password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add a new category'

    fill_in 'Icon', with: 'icon'
    fill_in 'Name', with: 'food dash'

    click_button 'Add'

    expect(page).to have_content('Group Category created successfully')
    expect(page).to have_content('food dash')
  end
end
