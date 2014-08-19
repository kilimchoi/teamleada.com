class Form
  include ActiveModel::Model

  def persisted?
    # Forms are never persisted
    false
  end

  #
  # Abstract Methods
  #
  def initialize
    # Sets up the form object and adds any instance variables.
  end

  def submit(params)
    # The general flow of this object is to:
    # 1) Set the attributes on the object(s)
    # 2) Make a called `valid?` that runs all validations on the object(s)
    # 3) Resonsible for calling `save` on each of the object(s)
    #
    # This method must return a boolean to determine if the submission was successful.
    #
    # If this method is not overridden, it will return false by default.
    return false
  end

  def set_attributes(params)
    # This method takes in the params hash and sets attributes
    # ex. self.email = params[:email]
  end

  # Validation methods should be prefixed with `validate_`

end
