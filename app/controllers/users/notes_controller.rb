class Users::NotesController < ApplicationController 

  def show 
    @note = Note.find(params[:id])
  end

  def new 
    @note = Note.new
  end

  def create 
    @user = User.find(params[:id])
    @note = @user.notes.new(note_params)

    if @note.save
    flash[:notice] = "#{@note.title} was created"
    redirect_to dashboard_path(current_user)
    else 
      flash[:notice] = "Unable to create note"
      render :new
    end
  end

  def edit 
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    flash[:notice] = "#{@note.title} was updated"
    redirect_to "/users/#{current_user.id}/note/#{@note.id}"
  end


  private 

  def note_params 
    params.require(:note).permit(:title, :body)
  end
end