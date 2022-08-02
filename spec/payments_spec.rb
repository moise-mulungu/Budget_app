require 'rails_helper'

RSpec.describe 'Payment', type: :request do
    payment = Payment.new(user_id: 1, category_id: 1, name: 'Payment', amount: 100)
    payment.save
    category = Category.new(user_id: 1, name: 'Category', icon: 'icon')
    category.save
    user = User.new(email: 'moise@gmail.com', password: '123456')
    user.save
    it 'should create a payment' do
        post "/payments"
        expect(response).to have_http_status(:created)
    end
    it 'should get all payments' do
        get '/payments'
        expect(response).to have_http_status(:ok)
    end
    it 'should get a payment' do
        get "/payments/#{payment.id}"
        expect(response).to have_http_status(:ok)
    end
    it 'should update a payment' do
        put "/payments/#{payment.id}", params: { payment: { name: 'Payment2' } }
        expect(response).to have_http_status(:updated)
    end
    it 'should delete a payment' do
        delete "/payments/#{payment.id}"
        expect(response).to have_http_status(:no_content)
    end
end