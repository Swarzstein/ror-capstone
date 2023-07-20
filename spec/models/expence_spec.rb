require 'rails_helper'

RSpec.describe Expence, type: :model do
  describe 'Associations' do
    it 'belongs to author' do
      expence = Expence.reflect_on_association(:author)
      expect(expence.macro).to eq(:belongs_to)
    end
    it 'has and belongs to many groups' do
      expence = Expence.reflect_on_association(:groups)
      expect(expence.macro).to eq(:has_and_belongs_to_many)
      expect(expence.options[:dependent]).to eq(:destroy)
    end
  end
  
  describe 'Validations' do
    let!(:user) { User.create(name: 'John Doe', email: "johny123@gmail.com", password: "123123") }
    it 'is not valid without a name' do
      expect(Expence.new(amount: 0, author_id: user.id)).to_not be_valid
    end
    it 'is not valid without an amount' do
      expect(Expence.new(name: 'Gerdex', author_id: user.id)).to_not be_valid
    end
    it 'is valid with valid attributes' do
      expect(Expence.new(name: 'Gerdex', amount: 0, author_id: user.id)).to be_valid
    end
    it 'is not valid with a negative amount' do
      expect(Expence.new(name: 'Gerdex', amount: -1, author_id: user.id)).to_not be_valid
    end
  end
end
