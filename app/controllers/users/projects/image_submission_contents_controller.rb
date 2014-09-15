class Users::Projects::ImageSubmissionContentsController < Users::Projects::BaseController
  load_and_authorize_resource :image_submission_content

  respond_to :html, :js

  def create
    @image_submission_content_form = ImageSubmissionContentForm.new(@user, @project)
    if @image_submission_content_form.submit(params[:image_submission_content_form])
      respond_to do |format|
        format.js { render json: {data: {}}, status: :ok }
      end
    else
      respond_to do |format|
        format.js { render json: {data: {error: "You must attach your file in order to upload it."}}, status: :unprocessable_entity }
      end
    end
  end

end
