class ShoppingListsController < ApplicationController

  # GET /shopping_lists
  # GET /shopping_lists.xml
  def index
    @shopping_lists = current_user.shopping_lists

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shopping_lists }
    end
  end

  # GET /shopping_lists/1
  # GET /shopping_lists/1.xml
  def show
    @shopping_list = ShoppingList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shopping_list }
    end
  end

  # GET /shopping_lists/new
  # GET /shopping_lists/new.xml
  def new
    @shopping_list = ShoppingList.new
    @shopping_list.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shopping_list }
    end
  end

  # GET /shopping_lists/1/edit
  def edit
    @shopping_list = ShoppingList.find(params[:id])
  end

  # POST /shopping_lists
  # POST /shopping_lists.xml
  def create
    @shopping_list = ShoppingList.new(params[:shopping_list])
    @shopping_list.user = current_user

    respond_to do |format|
      if @shopping_list.save
        flash[:notice] = "You've created your shopping list!"
        format.html { redirect_to(@shopping_list) }
        format.xml  { render :xml => @shopping_list, :status => :created, :location => @shopping_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shopping_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_lists/1
  # PUT /shopping_lists/1.xml
  def update
    @shopping_list = ShoppingList.find(params[:id])

    respond_to do |format|
      if @shopping_list.update_attributes(params[:shopping_list])
        flash[:notice] = "You've updated your shopping list!"
        format.html { redirect_to(@shopping_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shopping_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.xml
  def destroy
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.destroy

    respond_to do |format|
      format.html { redirect_to(shopping_lists_url) }
      format.xml  { head :ok }
    end
  end
end
