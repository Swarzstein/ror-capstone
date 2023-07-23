require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it 'has many entities' do
      user = User.reflect_on_association(:entities)
      expect(user.macro).to eq(:has_many)
      expect(user.options[:dependent]).to eq(:destroy)
    end
    it 'has many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
      expect(user.options[:dependent]).to eq(:destroy)
    end
  end
  
  describe 'Validations' do
    # it 'is valid with valid attributes' do
    #   expect(User.new(name: 'John Doe')).to be_valid
    # end
    it 'is valid with valid attributes' do
      expect(User.new(name: 'John Doe', email: "johny123@gmail.com", password: "123123")).to be_valid
    end
    
    it 'is not valid without a name' do
      expect(User.new(email: "johny123@gmail.com", password: "123123")).to_not be_valid
    end

    it 'is not valid without an email' do
      expect(User.new(name: 'John Doe', password: "123123")).to_not be_valid
    end

    it 'is not valid without a password' do
      expect(User.new(name: 'John Doe', email: "johny123@gmail.com")).to_not be_valid
    end

    it 'is not valid with a short password' do
      expect(User.new(name: 'John Doe', email: "johny123@gmail.com", password: "123")).not_to be_valid
    end

    it 'is not valid with only the name' do
      expect(User.new(name: 'John Doe')).not_to be_valid
    end
  end
end
