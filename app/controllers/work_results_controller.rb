class WorkResultsController < ApplicationController
  def index
    @work_results = WorkResult.all
  end

  def create
    @work_result = current_user.work_results.build( params[:work_result] )
    @work_result.save

    redirect_to :back
  end

end
