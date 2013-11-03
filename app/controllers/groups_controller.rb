class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :carts]

  # GET /groups
  def index
    @groups = current_user.joined_groups
  end

  # GET /groups/1
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create
    #set the group's owner to the current user
    params[:group][:owner_id] = current_user.id
    @group = Group.new(group_params)
    
    if @group.save
      @group_membership = GroupMembership.new({user_id: current_user.id, group_id: @group.id})
      if @group_membership.save
        redirect_to @group, notice: 'Group was successfully created.'
      else
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  def add_group_member
    @add_user = User.find_by_email(add_group_member_params[:email])

    #Check if the user to add is already in the group    
    existing_groups = @add_user.joined_groups.map { |g| g.id.to_s } if @add_user
    if @add_user == nil
      flash[:error] = "Could not add member"
      redirect_to :controller => 'groups', action: 'show', :id => params[:id] 
    elsif existing_groups.include?(params[:id])
      flash[:warning] = "Member already in group"
      redirect_to :controller => 'groups', action: 'show', :id => params[:id] 
    else
      @group_membership = GroupMembership.new(user_id: @add_user.id, group_id: params[:id])
      if @group_membership.save
        flash[:notice] = "Member added."
       redirect_to :controller => 'groups', action: 'show', :id => params[:id]
      else
        flash[:error] = "Could not add member"
        redirect_to :controller => 'groups', action: 'show', :id => params[:id]
      end
    end
  end

  def cart
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:owner_id, :name)
    end

    def add_group_member_params
      params.require(:person).permit(:email)
    end
end
