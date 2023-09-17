require 'rails_helper'

# rspec for features
RSpec.describe 'groups#index', type: :feature do
  let!(:file) { File.open(Rails.root.join('app', 'assets', 'images', 'medicine.png')) }
  let!(:user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com', password: '123123') }
  let!(:group) { Group.create(name: 'Medicine', icon: { io: file, filename: 'medicine.png', content_type: 'image/png' }, user_id: user.id) }
  let!(:expense) { Expense.create(name: 'Gerdex', amount: 5, author_id: user.id, group_ids: ['', group.id]) }
  let!(:expense2) { Expense.create(name: 'Acetaminofen', amount: 7, author_id: user.id, group_ids: ['', group.id]) }

  before :each do
    sign_in user
    visit groups_path
  end

  it 'shows the groups' do
    expect(page).to have_content('Medicine')
  end

  scenario 'user can create a group' do
    click_link(id: 'create-category')
    expect(page).to have_content('New Category')
  end
end
