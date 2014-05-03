class Admin::CodesController < Admin::BaseController
  before_filter :code, only: [:show, :edit, :update, :destroy]
  before_filter :codes, only: [:index]

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to admin_code_path(@code), info: "Create code: #{@code.value}"
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
