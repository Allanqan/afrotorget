class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /user
  def index
    @users = User.all
  end

  # GET /user_categories/1
  def show
  end

  # GET /user_categories/new
  def new
    @user = User.new
  end

  # GET /user_categories/1/edit
  def edit
  end

  # POST /user_categories
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_categories/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_categories/1
  def destroy
    @user.destroy
    redirect_to user_categories_url, notice: 'User category was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :image, :user_category)
  end
end

