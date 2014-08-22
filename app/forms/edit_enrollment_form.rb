class EditEnrollmentForm < Form

  delegate :name, to: :university, prefix: true

  validates :university_name, presence: true

  def initialize(user, params={})
    params ||= {}
    @user = user
    @enrollment = user.enrollments.find(params[:enrollment_id]) if params[:enrollment_id].present?
    @university = enrollment.university || University.find_by_university_params(params)
  end

  def enrollment
    @enrollment ||= Enrollment.new
  end

  def university
    @university ||= University.new
  end

  def set_attributes(params)
    set_university(params)
    set_enrollment(params)
  end

  def set_enrollment(params)
    enrollment.degree = params[:degree] if params[:degree].present?
    enrollment.field_of_study = params[:field_of_study] if params[:field_of_study].present?
    enrollment.notes = params[:notes] if params[:notes].present?
    enrollment.university = university
    enrollment.user = @user
  end

  def set_university(params)
    university.name = params[:university_name] if params[:university_name].present?
  end

  def save
    university.save
    enrollment.save
  end

end

