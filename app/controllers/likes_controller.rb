class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.find(params['data'])
    @query = Question.find(@answer.question_id)
    @vote = Vote.where(answer_id: @answer.id, user_id: current_user.id).take
    if @vote == nil
      @vote = Vote.new(user: current_user, answer: @answer)
        if @query.user == current_user
          @answer.confirmed = true
        end
      @vote.save
      @answer.likes +=1
      @answer.save
    else
      @answer.likes -=1
      @answer.save
      @vote.destroy
    end
  redirect_to question_path(@query.id)
  end
end
