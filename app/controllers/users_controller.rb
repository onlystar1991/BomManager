class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change_role]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.has_role? :admin
      role = 'admin'
    elsif @user.has_role? :user
      role = 'user'
    else
      role = 'super_visor'
    end
    respond_to do |format|
      format.json { 
        render json: { 
          status: "ok", 
          user: {
            id: @user.id,
            email: @user.email,
            name: "#{@user.first_name} #{@user.last_name}",
            photo: @user.photo.url,
            time: @user.created_at.strftime("%B %d,%Y <br> %I:%M%p").html_safe,
            role: role
          }
        }, 
        status: :ok 
      }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { 
          render json: { 
            status: "ok", 
            user: {
              id: @user.id,
              email: @user.email,
              name: "#{@user.first_name} #{@user.last_name}",
              photo: @user.photo.url,
              time: @user.created_at.strftime("%B %d,%Y <br> %I:%M%p").html_safe
            }
          }, 
          status: :ok 
        }
      else
        format.html { render :new }
        format.json { render json: @user.errors.full_messages, status: :ok }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors.full_messages, status: :ok }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_role
    if params[:role] == 'user'
      @user.remove_role(:super_visor)
      @user.add_role(:user)
      role = 'user'
    else
      @user.remove_role(:user)
      @user.add_role(:super_visor)
      role = 'super_visor'
    end
    
    respond_to do |format|
      format.json {
        render json: {
          status: 'ok',
          role: role
        }
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation);
    end
end
