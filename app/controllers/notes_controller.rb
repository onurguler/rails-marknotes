class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_note, only: [:show]

  def index
    @notes = Note.where(user_id: current_user).order('created_at DESC')
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :subtitle, :content)
  end
end
