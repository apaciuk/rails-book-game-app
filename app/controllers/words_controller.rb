class WordsController < ApplicationController
  def index 
    @words = Word.all
  end 

  def new 
    @word = Word.new
  end 

  def create 
    if @word = Word.create(word_params)
      redirect_to words_path
    else 
      render :new
    end
  end 

  private 

  def word_params 
    params.require(:word).permit(:value, :language)
  end
end
