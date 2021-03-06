class MicropostsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user,   only: :destroy

	  def create
	    @micropost = current_user.microposts.build(params[:micropost])
	    if @micropost.save
	      flash[:success] = "Micropost created!"
	    else
	  	  flash[:error] = "Micropost cannot be empty!"
	    end
		redirect_to root_url
	  end

	  def destroy
	  	  @micropost.destroy
   		  redirect_to root_url
	  end

private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end