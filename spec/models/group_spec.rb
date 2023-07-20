require 'rails_helper'

RSpec.describe Group, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # Test suite for Group model
  # Association test
  describe 'Associations' do
    # ensure Group model has a 1:m relationship with the Entity model
    it 'has many expences' do
      group = Group.reflect_on_association(:expences)
      expect(group.macro).to eq(:has_and_belongs_to_many)
      expect(group.options[:dependent]).to eq(:destroy)
    end
  end

  # Validation tests
  describe 'Validations' do
    let!(:user) { User.create(name: 'John Doe', email: "johny123@gmail.com", password: "123123") }
    it 'is not valid without a name' do
      expect(Group.new(user_id: user.id)).to_not be_valid
    end
    it 'is valid with valid attributes' do
      expect(Group.new(name: 'Medicine', user_id: user.id)).to be_valid
    end
  end
end
