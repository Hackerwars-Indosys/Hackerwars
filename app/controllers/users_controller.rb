require 'csv'
class UsersController < ApplicationController
  before_action :set_user, only: [:result, :show, :edit, :update, :destroy, :question]
  before_action :user_logged_in?, except: [:show, :login]
  before_action :check_user, only: [:result, :edit, :update, :destroy, :question]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  def question
  end

  def login
    $session["uid"] = 0;
  end

  def result
    @recommend_jobs = calculate_distance(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_question
    @user = User.find_by(id: params[:uid])
    @user.attributes = { params[:qid] => params[:ans] }
    @user.save()
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_user
      if $session.present?
        if @user.uid == $session.uid
        else
          redirect_to user_path($session)
        end
      else
        redirect_to login_user_path
      end
    end
      
    def set_user
      @user = User.find(params[:id])
    end

    def calculate_distance(user)
      csv_data = CSV.read('app/assets/data/jobs.csv', headers:false)
      jobs = {}
      response = []
      for data in csv_data do
        sum = 0
        if data[0] == "job_name" then
          next
        end
        for number in 1..5 do
          sum += (user["question" + number.to_s ].to_i - data[number].to_i) ** 2
        end
        jobs[data[0]] = sum
      end
      return jobs.sort_by{|k,v| v}
      for job in jobs.sort_by {|k, v| v} 
        response.append(job[0])
      end
      return response
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:provider, :uid, :name, :image_url, :old, :university, :job1, :job2, :job3, :question1, :question2, :question3, :question4, :question5)
    end
end
