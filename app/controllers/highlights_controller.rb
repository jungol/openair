class HighlightsController < ApplicationController
  def create
    @highlight = Highlight.create(highlight_params)
    respond_to do |format|
      format.html
      format.js {} 
    end
  end

  def destroy
    highlight = Highlight.find_by(highlight_params)
    highlight.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {head :ok}
    end
  end

  private

    def highlight_params
      params.require(:highlight).permit(:copy_id, :location)
    end
end


