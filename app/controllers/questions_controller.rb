class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @question = Question.new
    @answer = Answer.new
    @questions = Question.all.reverse_order
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.user_id = current_user.id
    if @question.save
      redirect_to action: 'index'
    end
  end

  def create_answer
    @answer = Answer.new(params.require(:answer).permit(:response, :question_id))
    @answer.user_id = current_user.id
    @answer.question_id=params[:question_id]
    if @answer.save
      redirect_to action: 'index'
    else
      puts @answer.errors.full_messages
    end
  end

end