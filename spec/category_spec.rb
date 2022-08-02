require 'rails_helper'

RSpec.describe 'Category', type: :request do
    category = Category.new(user_id: 1, name: 'Category', icon: 'icon')
    category.save
    user = User.new(email: 'moise@gmail.com', password: '123456')
    user.save
    it 'should create a category' do
        post "/categories"
        expect(response).to have_http_status(:created)
    end
    it 'should get all categories' do
        get '/categories'
        expect(response).to have_http_status(:ok)
    end
    it 'should get a category' do
        get "/categories/#{category.id}"
        expect(response).to have_http_status(:ok)
    end
    it 'should update a category' do
        put "/categories/#{category.id}", params: { category: { name: 'Category2' } }
        expect(response).to have_http_status(:updated)
    end
    it 'should delete a category' do
        delete "/categories/#{category.id}"
        expect(response).to have_http_status(:no_content)
    end
end