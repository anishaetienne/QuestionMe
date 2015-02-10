class QuestionsController < ApplicationController
  def index
       @opened = Question.where(status: 'Open').order('id ASC')  
       @solved = Question.where(status: 'Solved').order('id DESC')
  end

  def show
    @questions = Question.find(params[:id])
    @answers = Answer.find(params[:id])
  end

  def new
    @questions = Question.new
  end

  def create
    @questions = Question.new(params.require(:question).permit(:questions, :status))
    if @questions.save
      flash[:notice] = "Question was saved!"
      redirect_to @questions
    else
      flash[:error] = "Coud not save your question."
      render :new
    end
  end

  def edit
    @questions = Question.find(params[:id])
  end

  def update
    @questions = Question.find(params[:id])
    if @questions.update_attributes(params.require(:questions).permit(:questions, :status))
      flash[:notice] = "Post was updated."
      redirect_to @questions
    else
      flash[:error] = "Could not update your question."
      render :edit
    end
  end
end