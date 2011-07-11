class EventsController < ApplicationController
  before_filter :find_announce
  # GET /events
  # GET /events.xml
  def index
    @event = Event.find(:first, :conditions => ['actual_time > ?', Time.now], :order=>:actual_time)
    render :layout=>"welcome"
  end

  def archive
    @events = Event.find(:all, :conditions => ['actual_time < ?', Time.now], :order=>'actual_time desc')
  end

  def actual
    @events = Event.find(:all, :conditions => ['actual_time > ?', Time.now], :order=>'actual_time' )
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Событие успешно создано.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Событие успешно отредактировано.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end


 def find_announce
    @announcements = Event.find(:all, :conditions => ['actual_time > ?', Time.now], :order=>:actual_time, :limit=>'1,2')
 end
end