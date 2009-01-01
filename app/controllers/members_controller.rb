require 'csv'

class MembersController < ApplicationController
  layout "myCPD"
  
  # GET /members
  # GET /members.xml
  def index
    @members = Member.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        flash[:notice] = 'Member was successfully created.'
        format.html { redirect_to(@member) }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(@member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
  

  def select_img_file
  end
  
  def import_img_members

    @parsed_file=CSV::Reader.parse(params[:dump][:file])
    @parsed_file.shift #Ignore First Row
    n=0
    @parsed_file.each  do |row|
      if row[31].include?('Coach') || row[31].include?('Adjudicator') || row[31].include?('Scrutineer')
        m = Member.find_by_member_number(row[33])
        if not m  
          m = Member.new
        end
      
        m.member_number=row[33]
        m.title=row[0]
        m.first_name=row[1]
        m.last_name=row[4]
        m.member_type = row[31]
        m.address1 = row[6]
        m.address2 = row[7]
        m.suburb = row[8]
        m.state = row[9]
        m.postcode = row[10]
        m.country = row[11]
        m.email_address = row[12]
        m.business = row[13]
        m.direct_phone = row[14]
        m.private_phone = row[15]
        m.mobile_phone = row[16]
        m.facsimile = row[17]
        
        if m.save
          n=n+1
          GC.start if n%50==0
        end
      end
    end
    
    flash.now[:notice]="IMG Member Import Successful,  #{n} new records added to data base"

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
    
  end
end
