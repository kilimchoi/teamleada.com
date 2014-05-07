class Admin::CodesController < Admin::BaseController
  before_filter :code, only: [:show, :edit, :update, :destroy]
  before_filter :codes, only: [:index]

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

  def code
    @code = Code.find(params[:id])
  end

  def codes
    @codes = Code.all
  end

  def code_params
    params.require(:code).permit(:group, :value)
  end

end
