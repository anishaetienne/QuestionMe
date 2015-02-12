class QuestionsController < ApplicationController
  def index
       @opened = Question.where(status: 'Open').order('id ASC')  
       @solved = Question.where(status: 'Solved').order('id DESC').take(3)
  end

  def show
    @questions = Question.find(params[:id])
    @answers = Question.find(params[:id]).answers
    @anyAnswers = Question.find(params[:id]).answers.exists?


  end


  def new
    @questions = Question.new
  end


  def create
    @questions = Question.new(params.require(:question).permit(:questions, :status))

    if @questions.save
      flash[:notice] = "Question was saved!"
      redirect_to questions_path
    else
      flash[:error] = "Coud not save your question."
      render :new
    end
  end


  def edit
    @questions = Question.find(params[:id])
    @answers = Question.find(params[:id]).answers

  end


  def update
    @questions = Question.find(params[:id])


    if @questions.update_attributes(params.require(:question).permit(:questions, :status))
      flash[:notice] = "Post was updated."
      redirect_to @questions
    else
      flash[:error] = "Could not update your question."
      render :edit
    end
  end
end
