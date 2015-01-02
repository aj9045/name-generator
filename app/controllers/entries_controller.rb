class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def create

    @entry = Entry.new

    @first_name_id = FirstName.find_by(first_name: entry_params[:first_name]).id
    @last_name_id = LastName.find_by(last_name: entry_params[:last_name]).id
    @user_id = session[:user_id]
    if @entry.update_attributes(first_name_id: @first_name_id, last_name_id: @last_name_id, user_id: @user_id)
      flash[:notice] = "Your name has been saved"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show

  end

  def edit
    @user = User.find(session[:user_id])
    @entry = Entry.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      flash[:notice] = "Your note has been updated"
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:first_name, :last_name, :note, :user_id)
  end

end