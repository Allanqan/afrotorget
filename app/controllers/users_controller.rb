class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /user
  def index
    @users = User.all
  end

  # GET /user/1
  def show
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User  was successfully created.'
    else
      render :new
    end
  end

  protected def sign_up(resource_name, resource)
    super
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User  was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User  was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user/1
  def destroy
    @user.destroy
    redirect_to user_url, notice: 'User  was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :image, :user_category_id)
  end
end

