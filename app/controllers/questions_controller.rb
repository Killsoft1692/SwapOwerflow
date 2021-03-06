class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @question = Question.new
    @questions = Question.all.reverse_order.page(params[:page]).per(10)
    # @questions = Question.hot_likes.page(params[:page]).per(10)
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    @question.user = current_user
    @question.image = params[:question][:image]
    if @question.save
    else
      flash[:error] = 'This fields are required'
    end
    redirect_to action: 'index'
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    if cookies[:alert].present?
      cookies[:alert] = cookies[:alert].to_i + 1
    else
      cookies[:alert] = 1
    end

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
    @answer.image = params[:answer][:image]
    if @answer.save
    else
      flash[:error] = 'This field is required'
    end
    redirect_to question_path(params[:question_id])
  end

  def rated
    @questions = Question.hot_likes.page(params[:page]).per(10)
  end

end