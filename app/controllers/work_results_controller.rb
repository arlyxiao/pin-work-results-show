class WorkResultsController < ApplicationController
  def index
    @work_results = WorkResult.paginate(:page => params[:page], :per_page => 1)
  end

  def create
    @work_result = current_user.work_results.build( params[:work_result] )
    @work_result.save

    redirect_to :back
  end

end
