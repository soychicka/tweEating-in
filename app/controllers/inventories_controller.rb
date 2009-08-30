class InventoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
    :only => [:auto_complete_for_pantry_item_food_item_name]
  
  def auto_complete_for_pantry_item_food_item_name
    @food_item_names = 
      FoodItem.find(:all, :conditions => ['name like ?', "%#{params[:pantry_item][:food_item_name]}%"]).collect(&:name)
    render :inline => "<%= content_tag(:ul, @food_item_names.map {|f| content_tag(:li, h(f))}) %>"
  end
  
  # GET /inventories
  # GET /inventories.xml
  def index
    unless current_user.inventory
      redirect_to :action => 'new'
      return
    end
    @inventory = current_user.inventory

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.xml
  def show
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventory }
    end
  end

  # GET /inventories/new
  # GET /inventories/new.xml
  def new
    if current_user.inventory
      redirect_to edit_inventory_path(current_user.inventory)
      return
    end
    
    @inventory = Inventory.new
    @inventory.user = current_user
    @inventory.build_suggested_items

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventory }
    end
  end

  # GET /inventories/1/edit
  def edit
    @inventory = Inventory.find(params[:id])
  end

  # POST /inventories
  # POST /inventories.xml
  def create
    @inventory = Inventory.new(params[:inventory])

    respond_to do |format|
      if @inventory.save
        flash[:notice] = "You've created your inventory!"
        format.html { redirect_to(@inventory) }
        format.xml  { render :xml => @inventory, :status => :created, :location => @inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventories/1
  # PUT /inventories/1.xml
  def update
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      if @inventory.update_attributes(params[:inventory])
        flash[:notice] = "You've updated your inventory!"
        format.html { redirect_to(@inventory) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.xml
  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to(inventories_url) }
      format.xml  { head :ok }
    end
  end
end
