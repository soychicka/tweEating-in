 class PantryItemsController < ApplicationController
  # GET /pantry_items
  # GET /pantry_items.xml
  def index
    @pantry_items = PantryItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pantry_items }
    end
  end

  # GET /pantry_items/1
  # GET /pantry_items/1.xml
  def show
    @pantry_item = PantryItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pantry_item }
    end
  end

  # GET /pantry_items/new
  # GET /pantry_items/new.xml
  def new
    @pantry_item = PantryItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pantry_item }
      format.js   { render :partial => 'form_row'}
    end
  end

  # GET /pantry_items/1/edit
  def edit
    @pantry_item = PantryItem.find(params[:id])
  end

  # POST /pantry_items
  # POST /pantry_items.xml
  def create
    @pantry_item = PantryItem.new(params[:pantry_item])

    respond_to do |format|
      if @pantry_item.save
        flash[:notice] = 'Ingredient was successfully created.'
        format.html { redirect_to(@pantry_item) }
        format.xml  { render :xml => @pantry_item, :status => :created, :location => @pantry_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pantry_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pantry_items/1
  # PUT /pantry_items/1.xml
  def update
    @pantry_item = PantryItem.find(params[:id])

    respond_to do |format|
      if @pantry_item.update_attributes(params[:pantry_item])
        flash[:notice] = 'Ingredient was successfully updated.'
        format.html { redirect_to(@pantry_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pantry_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pantry_items/1
  # DELETE /pantry_items/1.xml
  def destroy
    @pantry_item = PantryItem.find(params[:id])
    @pantry_item.destroy

    respond_to do |format|
      format.html { redirect_to(pantry_items_url) }
      format.xml  { head :ok }
    end
  end
end