# frozen_string_literal: true

module Web
  class UsersController < Web::ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find params[:id]
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find params[:id]
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: t('success')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find params[:id]

      if @user.update(user_params)
        redirect_to @user, notice: t('success')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find params[:id]

      @user.destroy

      redirect_to users_url, notice: t('success')
    end

    private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :address,
        :password_digest,
        :balance
      )
    end
  end
end
