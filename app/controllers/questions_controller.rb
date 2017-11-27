class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @question = Question.new
    @questions = Question.all.reverse_order.page(params[:page]).per(10)
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.user = current_user
    if @question.save
    else
      flash[:error] = 'This fields are required'
    end
    redirect_to action: 'index'
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.destroy
    else
      flash[:error] = 'You must be the owner'
    end
    redirect_to action: 'index'
  end

  def create_answer
    @answer = Answer.new(params.require(:answer).permit(:response, :question_id))
    @answer.user = current_user
    @answer.question_id=params[:question_id]
    if @answer.save
    else
      flash[:error] = 'This field is required'
    end
    redirect_to question_path(params[:question_id])
  end

end