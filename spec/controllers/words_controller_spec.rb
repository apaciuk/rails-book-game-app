require 'rails_helper'

RSpec.describe WordsController, type: :controller do 
    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
           end 
        end

        context 'when there are some words present' do 
            it 'assigns @words' do 
                word = Word.create(value: 'word', language: 'en')
                get :index
                expect(assigns(:words)).to eq([word])
            end
        end 

         context 'when there are no words present' do 
            it 'assigns @words' do 
                get :index
                expect(assigns(:words)).to eq([])
            end
        end
end