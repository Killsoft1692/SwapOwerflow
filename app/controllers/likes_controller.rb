class LikesController < ApplicationController
  def create
    @like = Answer.find(params['data'])
    query = Question.find(@like.question_id)
    if query.user == current_user
      @like.confirmed = true
    end

    @like.votes +=1
    @like.save

    redirect_to question_path(query.id)

  end

end