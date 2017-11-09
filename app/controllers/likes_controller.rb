class LikesController < ApplicationController
  def index
    @like = Answer.find(params['data'])
    query = Question.find(@like.question_id)
    if query.user_id == current_user.id
      @like.confirmed = true
    end

    @like.votes +=1
    @like.save

    redirect_to root_path

  end

end