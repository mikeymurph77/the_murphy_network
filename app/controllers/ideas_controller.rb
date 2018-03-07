class IdeasController < ApplicationController
  def index
    case params[:filter]
    when 'idea'
      @ideas = Idea.where(status: 'Idea').order('votes::integer DESC')
    when 'in_progress'
      @ideas = Idea.where(status: 'In Progress').order('votes::integer DESC')
    when 'done'
      @ideas = Idea.where(status: 'Done').order('votes::integer DESC')
    when 'archived'
      @ideas = Idea.where(status: 'Archived').order('votes::integer DESC')
    else
      @ideas = Idea.where(status: ['Idea', 'In Progress', 'Done']).order('votes::integer DESC')
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      flash[:success] = 'Great! Your idea has been saved'
      redirect_to ideas_path
    else
      flash[:error] = 'Oops please fill out all the fields.'
      render :new
    end
  end

  def vote
    idea = Idea.find(params[:id])
    if params[:direction] == 'up'
      idea.votes += 1
    else
      idea.votes -= 1
    end

    idea.update(votes: idea.votes)

    respond_to do |format|
      format.html
      format.json { render json: { votes: idea.votes, id: idea.id } }
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :poster, :votes)
  end
end
