class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
  before_filter :require_login

  def index
    @tickets = Ticket.all

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
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new
    @ticket.status = "Open"
    @ticket.ticket_type = "Repair"
    @ticket.opened_at = Time.now

    respond_to do |format|
      if current_user.can_write_tickets? then
        format.html # new.html.erb
      else
        format.html { redirect_to login_path, notice: 'Please log in to continue.' }
      end
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  def lookup
    @location = Location.find(params[:ticket][:location_id])
    @rooms = @location.rooms
    respond_to do |format|
      format.js
    end
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user = current_user

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
end
