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

        it 'renders the index template' do 
            get :index
            expect(response).to render_template('index')
        end
    describe 'GET new' do 
        before { get :new }
        it 'returns http success' do 
            get :new
            expect(response).to have_http_status(:success)
        end
        it 'renders the new template' do 
            get :new
            expect(response).to render_template('new')
        end 

        it 'assigns @word' do 
            get :new
            expect(assigns(:word)).to be_a_new(Word)
        end 

        it 'renders the new template' do 
            get :new
            expect(response).to render_template('new')
        end
    end 

    describe 'POST create' do 
    subject { post :create, params: { word: { value: 'word', language: 'en' } } } 

    it 'creates a new word' do 
        expect { subject }.to change(Word, :count).by(1)
    end 
end
end