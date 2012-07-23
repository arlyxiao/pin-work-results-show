class TagsController < ApplicationController
  def list_by_tag
    tag = URI.decode(request.fullpath).sub('/tags/', '')
    @work_results = WorkResult.tagged_with(tag).paginate(:page => params[:page], :per_page => 20)
  end
end
