require 'rails_helper'

RSpec.describe 'GroupShow', type: :feature do
  let!(:file) { File.open(Rails.root.join('app', 'assets', 'images', 'medicine.png')) }
  let!(:user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com', password: '123123') }
  let!(:group) do
    Group.create(name: 'Medicine', icon: { io: file, filename: 'medicine.png', content_type: 'image/png' },
                 user_id: user.id)
  end
  let!(:expense) { Expense.create(name: 'Gerdex', amount: 5, author_id: user.id, group_ids: ['', group.id]) }
  let!(:expense2) { Expense.create(name: 'Acetaminofen', amount: 7, author_id: user.id, group_ids: ['', group.id]) }

  before :each do
    sign_in user
    visit group_path(group)
  end

  it 'shows the group' do
    expect(page).to have_content('Gerdex')
    expect(page).to have_content('Acetaminofen')
  end

  scenario 'user can create an expense' do
    click_link('NEW TRANSACTION')
    expect(page).to have_content('New Transaction')
  end
end
