class CompletedActivitiesController < ApplicationController
  layout "myCPD"
  
  # GET /member/:id/completed_activities
  # GET /member/:id/completed_activities.xml
  def index
    @member = Member.find(params[:member_id])
    @completed_activities = @member.completed_activities.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
  
  # GET /member/:member_id/completed_activities/:id/edit
  def edit
    @member = Member.find(params[:member_id])
    @completed_activity = CompletedActivity.find(params[:id])
    @activities = Activity.find(:all, :order => "accreditation_type, reference_number")
  end
  
  # PUT /member/:id/completed_activities
  # PUT /member/:id/completed_activities.xml
  def update
    @member = Member.find(params[:member_id])
    @completed_activity = CompletedActivity.find(params[:id])

    respond_to do |format|
      if @completed_activity.update_attributes(params[:completed_activity])
        flash[:notice] = 'Completed Activity was successfully updated.'
        format.html { redirect_to(member_completed_activities_path(@member)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /member/:member_id/completed_activities/new
  # GET /member/:member_id/completed_activities/new.xml
  def new
    @member = Member.find(params[:member_id])
    @completed_activity = CompletedActivity.new
    @activities = Activity.find(:all, :order => "accreditation_type, reference_number")
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end
  
  # POST /member/:member_id/completed_activities
  # POST /member/:member_id/completed_activities.xml
  def create
    @member = Member.find(params[:member_id])
    @completed_activity = CompletedActivity.new(params[:completed_activity])
    
    @member.completed_activities << @completed_activity
    
    respond_to do |format|
      if @member.save
        flash[:notice] = 'Completed Activity was successfully created.'
        format.html { redirect_to(member_completed_activities_path(@member)) }
        format.xml  { render :xml => @completed_activity, :status => :created, :location => @completed_activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @completed_activity.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /member/:member_id/completed_activities/:id
  # DELETE /member/:member_id/completed_activities/:id.xml
  def destroy
    @member = Member.find(params[:member_id])
    @completed_activity = CompletedActivity.find(params[:id])
    @completed_activity.destroy
    
    respond_to do |format|
      format.html { redirect_to(member_completed_activities_path(@member)) }
      format.xml  { head :ok }
    end
  end
  
  def update_defaults
    
    begin
      @activity = Activity.find_by_reference_number(params[:reference_number])
      
    rescue ActiveRecord::NotFound
      render :update do |page|
        page['completed_activity_units'].value = ''
        page['activity_description'].replace_html ''
        page['completed_activity_units'].visual_effect :highlight, :startcolor => "#eedd82", :endcolor => "#ffffe0"
      end
    else  
      render :update do |page|
        page['completed_activity_units'].value = @activity.units
        page['activity_description'].replace_html @activity.description
        page['completed_activity_units'].visual_effect :highlight, :startcolor => "#eedd82", :endcolor => "#ffffe0"
      end
    end
    
  end
  
end
