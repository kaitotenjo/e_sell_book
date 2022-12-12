class Admins::UsersController < ApplicationController
  before_action :set_admins_user, only: %i[ show edit update destroy ]
  layout"admins/base"

  # GET /admins/users or /admins/users.json
  def index
    @admins_users = User.all.page(params[:page]).per(7).includes(avatar_attachment: :blob)
  end

  # GET /admins/users/1 or /admins/users/1.json
  def show
  end

  # GET /admins/users/new
  def new
    @admins_user = User.new
  end

  # GET /admins/users/1/edit
  def edit
  end

  # POST /admins/users or /admins/users.json
  def create
    redirect_to admins_users_path
  end

  # PATCH/PUT /admins/users/1 or /admins/users/1.json
  def update
    respond_to do |format|

      if @admins_user.update(admins_user_params)
        format.html { redirect_to admins_user_url(@admins_user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/users/1 or /admins/users/1.json
  def destroy
    @admins_user.destroy

    respond_to do |format|
      format.html { redirect_to admins_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_user
      @admins_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_user_params
      if params[:role]==0 
        params[:role]="user"
      else
        params[:role]="admin"
      end
      return params.permit( :name, :email, :role )
    end
end
