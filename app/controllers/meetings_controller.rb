class MeetingsController < ApplicationController
  def new

  end

  def edit
  	@meeting = Meeting.find(params[:id])
  end

  def index
    @meetings = Meeting.all
  	@new_meeting = Meeting.new
    @desc = params[:search][:desc] rescue ""
  	respond_to do |format|
      format.html
      format.json { 
        render :json => @meetings}
      end
    @errors = params[:errors] 
  end

  def create 
  	@meeting = Meeting.new(meeting_params)
    @meeting.department = @current_dep
    @meeting.user = @current_user if @current_user != nil
  	if @meeting.save 
  		redirect_to meetings_path
  	else
      @errors = []
      if @meeting.errors.any?
        @meeting.errors.full_messages.each do |msg|
          @errors.push msg
        end
      end
      redirect_to meetings_path(errors: @errors)
  	end
  end

  def destroy
  	@meeting = Meeting.find(params[:id])
    if !@meeting.anuluar 
    	@meeting.anuluar = true
      @meeting.color = "#FF0000"
      @meeting.description += " - I Anuluar"
    else
      @meeting.anuluar = false
      if @meeting.title ==  "Takim ne Showroom - Gjakove"
        @meeting.color = "#cf8608"
      elsif @meeting.title == "Takim ne Meeting Room"
        @meeting.color = "#0886cf"
      elsif @meeting.title == "Takim ne Punetoria Fushe Kosove"
        @meeting.color = "#e685e1"
      elsif @meeting.title == "Takim ne Showroom - Marigona"
        @meeting.color = "#03fca5"
      end
      @meeting.description.slice!(" - I Anuluar")
    end
    @meeting.save
  	redirect_to meetings_path
  end

  def update
  	@meeting = Meeting.find(params[:id])
    if @meeting.department == @current_dep
    	if @meeting.update_attributes(meeting_params)
    		redirect_to meetings_path
    	else
        @errors = []
        if @meeting.errors.any?
          @meeting.errors.full_messages.each do |msg|
            @errors.push msg
          end
        end
        redirect_to meetings_path(errors: @errors)
      end
    else
      flash[:danger] = "Takimi eshte caktuar nga nje departament tjeter."
      redirect_to meetings_path(errors: @errors)
    end
  end
  private

  def meeting_params
  	params.require(:meeting).permit(:title, :start, :end, :color, :description)
  end

end
