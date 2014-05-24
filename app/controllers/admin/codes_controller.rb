class Admin::CodesController < Admin::BaseController
  load_and_authorize_resource
  require 'securerandom'

  respond_to :html, :json

  def new
    @code = Code.new
    # TODO: Hopefully there aren't any collisions...
    @code.value = SecureRandom.hex(4)
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to admin_codes_path, info: "Create code: #{@code.value}"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @code.update_attributes(code_params)
      respond_to do |format|
        format.json { render json: @code.to_json, status: :ok }
        format.html {
          flash[:info] = "You have edited the code for user type: #{@code.user_type}"
          redirect_to admin_code_path(@code)
        }
      end
    else
      respond_to do |format|
        format.json { render json: @code.to_json, status: :unprocessible_entity }
        format.html {
          flash[:error] = "There was a problem updating the code for user type: #{@code.user_type}"
          redirect_to admin_code_path(@code)
        }
      end
    end

  end

  def destroy
  end

  def index
  end

  private

  def code_params
    params.require(:code).permit(:access_type, :value, :user_type, :enabled)
  end

end
