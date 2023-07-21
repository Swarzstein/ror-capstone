require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Associations' do
    it 'belongs to author' do
      expense = Expense.reflect_on_association(:author)
      expect(expense.macro).to eq(:belongs_to)
    end
    it 'has and belongs to many expenses' do
      expense = Expense.reflect_on_association(:groups)
      expect(expense.macro).to eq(:has_and_belongs_to_many)
      expect(expense.options[:dependent]).to eq(:destroy)
    end
  end
  
  describe 'Validations' do
    let!(:user) { User.create(name: 'John Doe', email: "johny123@gmail.com", password: "123123") }
    it 'is not valid without a name' do
      expect(Expense.new(amount: 0, author_id: user.id)).to_not be_valid
    end
    it 'is not valid without an amount' do
      expect(Expense.new(name: 'Gerdex', author_id: user.id)).to_not be_valid
    end
    it 'is valid with valid attributes' do
      expect(Expense.new(name: 'Gerdex', amount: 0, author_id: user.id)).to be_valid
    end
    it 'is not valid with a negative amount' do
      expect(Expense.new(name: 'Gerdex', amount: -1, author_id: user.id)).to_not be_valid
    end
  end

  describe 'getting expenses' do
    let!(:user) { User.create(name: 'John Doe', email: "johny123@gmail.com", password: "123123") }
    let!(:group) { Group.create(name: 'Medicine', user_id: user.id) }
    let!(:expense) { Expense.create(name: 'Gerdex', amount: 5, author_id: user.id, group_ids: ["", group.id]) }
    let!(:expense2) { Expense.create(name: 'Acetaminofen', amount: 7, author_id: user.id, group_ids: ["", group.id]) }
    it 'is valid with valid attributes' do
      expect(group.expenses).to eq([expense, expense2])
    end
  end
end
