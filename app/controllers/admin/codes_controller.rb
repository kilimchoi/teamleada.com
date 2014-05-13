class Admin::CodesController < Admin::BaseController
  load_and_authorize_resource
  require 'securerandom'

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
  end

  def destroy
  end

  def index
  end

  private

  def code_params
    params.require(:code).permit(:group, :value, :user_type)
  end

end
