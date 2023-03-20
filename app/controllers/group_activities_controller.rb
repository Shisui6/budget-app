class GroupActivitiesController < ApplicationController
  before_action :set_group_activity, only: %i[ show edit update destroy ]

  # GET /group_activities or /group_activities.json
  def index
    @group_activities = GroupActivity.all
  end

  # GET /group_activities/1 or /group_activities/1.json
  def show
  end

  # GET /group_activities/new
  def new
    @group_activity = GroupActivity.new
  end

  # GET /group_activities/1/edit
  def edit
  end

  # POST /group_activities or /group_activities.json
  def create
    @group_activity = GroupActivity.new(group_activity_params)

    respond_to do |format|
      if @group_activity.save
        format.html { redirect_to group_activity_url(@group_activity), notice: "Group activity was successfully created." }
        format.json { render :show, status: :created, location: @group_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_activities/1 or /group_activities/1.json
  def update
    respond_to do |format|
      if @group_activity.update(group_activity_params)
        format.html { redirect_to group_activity_url(@group_activity), notice: "Group activity was successfully updated." }
        format.json { render :show, status: :ok, location: @group_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_activities/1 or /group_activities/1.json
  def destroy
    @group_activity.destroy

    respond_to do |format|
      format.html { redirect_to group_activities_url, notice: "Group activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_activity
      @group_activity = GroupActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_activity_params
      params.require(:group_activity).permit(:activity_id, :group_id)
    end
end
