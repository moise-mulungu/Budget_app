require 'rails_helper'

RSpec.describe 'Category', type: :request do
    category = Category.new(user_id: 1, name: 'Category', icon: 'icon')
    category.save
    user = User.new(email: 'moise@gmail.com', password: '123456')
    user.save
    
    it 'is valid with valid attributes' do
        expect(category).to be_valid
    end
    
    it 'is not valid without a user_id' do
        category.user_id = nil
        expect(category).to_not be_valid
    end
    it 'is not valid without a icon' do
        category.icon = nil
        expect(category).to_not be_valid
    end
    it 'is not valid with a name longer than 50 characters' do
        category.name = 'a' * 51
        expect(category).to_not be_valid
    end
    it 'is not valid with a icon longer than 50 characters' do
        category.icon = 'a' * 51
        expect(category).to_not be_valid
    end
    it 'is not valid with a name shorter than 3 characters' do
        category.name = 'a' * 2
        expect(category).to_not be_valid
    end
    it 'is not valid with a icon shorter than 3 characters' do
        category.icon = 'a' * 2
        expect(category).to_not be_valid
    end
    it 'is not valid with a name that already exists' do
        category2 = Category.new(user_id: 1, name: 'Category', icon: 'icon')
        category2.save
        category.name = category2.name
        expect(category).to_not be_valid
    end
    it 'is not valid with a icon that already exists' do
        category2 = Category.new(user_id: 1, name: 'Category', icon: 'icon')
        category2.save
        category.icon = category2.icon
        expect(category).to_not be_valid
    end
    it 'is not valid with a user_id that does not exist' do
        category.user_id = 2
        expect(category).to_not be_valid
    end    
    it 'should get a category' do
        get "/categories/#{category.id}"
        expect(response).to have_http_status(:ok)
    end
    
end