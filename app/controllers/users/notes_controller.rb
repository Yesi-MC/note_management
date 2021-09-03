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
    if invalid_title_length?
      flash[:notice] = "Title cannot be more than 30 characters"
      render :new
    elsif invalid_body_length?
      flash[:notice] = "Body cannot be more than 1000 characters"
      render :new
    elsif empty_title? && body_not_empty? 
      @note.update(title: params[:note][:body][0..29])
      if @note.save
        flash[:notice] = "#{@note.title} was created"
        redirect_to dashboard_path(current_user)
      else 
        flash[:notice] = "Unable to create note"
        render :new
      end
    else
      if @note.save 
        flash[:notice] = "#{@note.title} was created"
        redirect_to dashboard_path(current_user)
      else 
        flash[:notice] = "Unable to create note"
        render :new
      end
    end 
  end

  def edit 
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if invalid_title_length?
      flash[:notice] = "Title cannot be more than 30 characters"
      render :edit
    elsif invalid_body_length?
      flash[:notice] = "Body cannot be more than 1000 characters"
      render :edit
    else
      if @note.update(note_params)
        flash[:notice] = "#{@note.title} was updated"
        redirect_to dashboard_path(current_user)
      else 
        flash[:notice] = "Unable to create note"
        render :edit
      end
    end 
  end

  def destroy 
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = "Note was sucessfully deleted"
    redirect_to dashboard_path(current_user)
  end

  private 

  def note_params 
    params.require(:note).permit(:title, :body)
  end

  def invalid_title_length?
    params[:note][:title].length > 30
  end

  def invalid_body_length?
    params[:note][:body].length > 1000
  end

  def empty_title?
    params[:note][:title].length == 0
  end

  def body_not_empty?
    params[:note][:body].length != 0
  end
end




 