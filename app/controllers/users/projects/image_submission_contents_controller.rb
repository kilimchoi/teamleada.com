class Users::Projects::ImageSubmissionContentsController < Users::Projects::BaseController
  load_and_authorize_resource :image_submission_content

  respond_to :html, :js

  def create
    @slide = Slide.find_by(
      parent_type: params[:parent_type],
      parent_id: params[:parent_id],
      slide_id: params[:slide_id],
    )

    @image_submission_content_form = ImageSubmissionContentForm.new(@user, @project, @slide)
    if @image_submission_content_form.submit(params[:image_submission_content_form])
      respond_to do |format|
        format.js { render json: {data: {}}, status: :ok }
      end
    else
      respond_to do |format|
        format.js { render json: {data: {error: "You must attach a file and it must be an image! (png, jpg, or jpeg extension)"}}, status: :unprocessable_entity }
      end
    end
  end

end
