class ActivitiesController < ApplicationController
  before_action :authenticate_user! unless Rails.env == 'test'
  before_action :set_activity, only: %i[show edit update destroy]

  # GET /activities or /activities.json
  def index
    @page = 'Transactions'
    @group = Group.find(params[:group_id])
    @group_activities = GroupActivity.where(group_id: params[:group_id]).order('created_at DESC')
    @activities = []
    @group_activities.each do |a|
      activity = Activity.find(a.activity_id)
      @activities << activity
    end
  end

  # GET /activities/1 or /activities/1.json
  def show; end

  # GET /activities/new
  def new
    @page = 'New Transaction'
    @id = params[:group_id]
    @name = Group.find(params[:group_id]).name
    puts @group.inspect
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit; end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    @group_activity = GroupActivity.new(group: Group.find(params[:group_id]), activity: @activity)

    respond_to do |format|
      if @activity.save && @group_activity.save
        format.html do
          redirect_to "/groups/#{params[:group_id]}/activities", notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:name, :amount).merge(user: current_user)
  end
end
