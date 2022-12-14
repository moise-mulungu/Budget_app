require 'rails_helper'

RSpec.describe 'Payment', type: :request do
  payment = Payment.new(user_id: 1, category_id: 1, name: 'Payment', amount: 100)
  payment.save
  category = Category.new(user_id: 1, name: 'Category', icon: 'icon')
  category.save
  user = User.new(email: 'moise@gmail.com', password: '123456')
  user.save
  it 'is valid with valid attributes' do
    expect(payment).to be_valid
  end
  it 'is not valid without a user_id' do
    payment.user_id = nil
    expect(payment).to_not be_valid
  end
  it 'is not valid without a category_id' do
    payment.category_id = nil
    expect(payment).to_not be_valid
  end
  it 'is not valid without a name' do
    payment.name = nil
    expect(payment).to_not be_valid
  end
  it 'is not valid without a amount' do
    payment.amount = nil
    expect(payment).to_not be_valid
  end
  it 'is not valid with a name longer than 50 characters' do
    payment.name = 'a' * 51
    expect(payment).to_not be_valid
  end
  it 'is not valid with a amount longer than 50 characters' do
    payment.amount = 'a' * 51
    expect(payment).to_not be_valid
  end
  it 'is not valid with a name shorter than 3 characters' do
    payment.name = 'a' * 2
    expect(payment).to_not be_valid
  end
  it 'is not valid with a amount shorter than 3 characters' do
    payment.amount = 'a' * 2
    expect(payment).to_not be_valid
  end
  it 'is not valid with a name that already exists' do
    payment2 = Payment.new(user_id: 1, category_id: 1, name: 'Payment', amount: 100)
    payment2.save
    payment.name = payment2.name
    expect(payment).to_not be_valid
  end
  it 'is not valid with a amount that already exists' do
    payment2 = Payment.new(user_id: 1, category_id: 1, name: 'Payment', amount: 100)
    payment2.save
    payment.amount = payment2.amount
    expect(payment).to_not be_valid
  end
  it 'is not valid with a user_id that does not exist' do
    payment.user_id = 2
    expect(payment).to_not be_valid
  end
  it 'is not valid with a category_id that does not exist' do
    payment.category_id = 2
    expect(payment).to_not be_valid
  end
end
