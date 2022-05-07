class UserCategoriesController < ApplicationController
  before_action :set_user_category, only: [:show, :edit, :update, :destroy]

  # GET /user_categories
  def index
    @user_categories = UserCategory.all
  end

  # GET /user_categories/1
  def show
  end

  # GET /user_categories/new
  def new
    @user_category = UserCategory.new
  end

  # GET /user_categories/1/edit
  def edit
  end

  # POST /user_categories
  def create
    @user_category = UserCategory.new(user_category_params)

    if @user_category.save
      redirect_to @user_category, notice: 'User category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_categories/1
  def update
    if @user_category.update(user_category_params)
      redirect_to @user_category, notice: 'User category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_categories/1
  def destroy
    @user_category.destroy
    redirect_to user_categories_url, notice: 'User category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_category
      @user_category = UserCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_category_params
      params.require(:user_category).permit(:name, :description)
    end
end
