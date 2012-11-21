class SettingsController < ApplicationController
  before_filter :find_user

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to suppliers_url, notice: 'Your settings was succefully updated!'
    else
      render action: "edit"
    end
  end



  private
    def find_user
      @user = current_user
    end
end
