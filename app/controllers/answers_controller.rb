class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer successfully submitted!"
      @question = @answer.question
      redirect to question_path(@question)
    else
      flash[:errors] = @answer.errors.full_messages.join(', ')
      render :"questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(
      :description,
      :question
    )
  end
end
