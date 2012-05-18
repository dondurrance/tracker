class TicketsController < ApplicationController
  layout 'main'

  before_filter :login_required
  before_filter :require_https




  # GET /tickets
  # GET /tickets.xml

  def index
      @content_for_title = "Tickets: Index"


    if params[:filter].nil? then
      params[:filter] = Hash.new
      params[:filter][:status] = "Open"
      params[:filter][:ticket_type] = "Repair"
    end

    if params[:filter][:status] == "All" && params[:filter][:ticket_type] == "All" then
      @tickets = Ticket.find(:all, :order => "opened_at DESC")
      @filter = params[:filter]
    elsif params[:filter][:status] == "All" then
      @tickets = Ticket.where(:ticket_type => params[:filter][:ticket_type]).order(:opened_at).reverse_order 
      @filter = params[:filter]
    elsif params[:filter][:ticket_type] == "All" then
      @tickets = Ticket.where(:status => params[:filter][:status]).order(:opened_at).reverse_order
      @filter = params[:filter]
    else
      @tickets = Ticket.where(params[:filter]).order(:opened_at).reverse_order
      @filter = params[:filter]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
      format.js
    end
  end

  def lookup
    @location = Location.find(params[:ticket][:location_id])
    @rooms = @location.rooms
    respond_to do |format|
      format.js
    end
  end


  def get_rooms
    render :layout => false
    render :text => 'raaagh'
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    
    tik = Ticket.new(params[:ticket])
    tik.user = current_user
    @ticket = tik
    if !@ticket.opened_at then @ticket.opened_at = Time.now end

    respond_to do |format|
     if @ticket.save
         format.html { redirect_to(@ticket, :notice => 'Ticket was successfully created.') }
         format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
     end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.status != "Closed" && params[:ticket]["status"] == "Closed" && 
      params[:ticket]["closed_at"].blank? then
      params[:ticket]["closed_at"] = Time.now.to_s
    end

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket was successfully updated. ' + params[:ticket]["closed_at"]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    if current_user.can_write_tickets? then
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
    end

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
end
