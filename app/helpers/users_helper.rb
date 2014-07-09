module UsersHelper

  def update_with_linked_in_params(auth)
    (auth.info.first_name rescue nil).nil? ? nil : registered_user.update(first_name: auth.info.first_name)
    (auth.info.last_name rescue nil).nil? ? nil : registered_user.update(last_name: auth.info.last_name)
    (auth.uid rescue nil).nil? ? nil : registered_user.update(linkedin_id: auth.uid)

    (auth.info.nickname rescue nil).nil? ? nil: registered_user.update(nickname: auth.info.nickname)
    (auth.extra.raw_info.location.name rescue nil).nil? ? nil : registered_user.update(location: auth.extra.raw_info.location.name)
    (auth.extra.raw_info.location.country.code rescue nil).nil? ? nil : registered_user.update(country_code: auth.extra.raw_info.location.country.code)
    (auth.extra.raw_info.summary rescue nil).nil? ? nil : registered_user.update(bio: auth.extra.raw_info.summary)
    (auth.extra.raw_info.pictureUrls.values[1][0] rescue nil).nil? ? nil : registered_user.update(image: auth.extra.raw_info.pictureUrls.values[1][0])
    (auth.extra.raw_info.phoneNumbers.values[1][0].phoneNumber rescue nil).nil? ? nil : registered_user.update(phone: auth.extra.raw_info.phoneNumbers.values[1][0].phoneNumber)
    (auth.info.headline rescue nil).nil? ? nil : registered_user.update(headline: auth.info.headline)
    (auth.info.industry rescue nil).nil? ? nil : registered_user.update(industry: auth.info.industry)
    (auth.info.urls.public_profile rescue nil).nil? ? nil : registered_user.update(public_prof_url: auth.info.urls.public_profile)

    registered_user.update(date_of_birth: (Date.new((auth.extra.raw_info.dateOfBirth.year rescue nil), (auth.extra.raw_info.dateOfBirth.month rescue nil), (auth.extra.raw_info.dateOfBirth.day rescue nil)) rescue nil))
    (auth.extra.raw_info.educations.values[1][0].schoolName rescue nil).nil? ? nil : registered_user.update(school_name: auth.extra.raw_info.educations.values[1][0].schoolName)
    (auth.extra.raw_info.educations.values[1][0].endDate.year rescue nil).nil? ? nil : registered_user.update(grad_year: auth.extra.raw_info.educations.values[1][0].endDate.year)
    (auth.extra.raw_info.interests rescue nil).nil? ? nil : registered_user.update(interests: auth.extra.raw_info.interests)
    (auth.extra.raw_info.jobBookmarks._total rescue nil).nil? ? nil : registered_user.update(job_bookmarks_count: auth.extra.raw_info.jobBookmarks._total)
    (auth.extra.raw_info.positions._total rescue nil).nil? ? nil : registered_user.update(job_total_count: auth.extra.raw_info.positions._total)
    (auth.extra.raw_info.publications._total rescue nil).nil? ? nil : registered_user.update(publications_count: auth.extra.raw_info.publications._total)
    (auth.extra.raw_info.recommendationsReceived._total rescue nil).nil? ? nil : registered_user.update(recom_count: auth.extra.raw_info.recommendationsReceived._total)
    (auth.extra.raw_info.skills._total rescue nil).nil? ? nil : registered_user.update(skills_count: auth.extra.raw_info.skills._total)

    registered_user.skip_confirmation!
    registered_user.save(validate: false)
    registered_user
  end

  def extract_date(date_hash)
    Date.new((date_hash.year rescue nil), (date_hash.month rescue nil), (date_hash.day rescue nil)) rescue nil
  end

  def self.new_with_linked_in_params(auth)
    user = User.new(
      first_name:           (auth.info.first_name rescue nil),
      last_name:            (auth.info.last_name rescue nil),
      linkedin_id:          (auth.uid rescue nil),
      email:                (auth.info.email rescue nil),
      nickname:             (auth.info.nickname rescue nil),
      location:             (auth.extra.raw_info.location.name rescue nil),
      country_code:         (auth.extra.raw_info.location.country.code rescue nil),
      bio:                  (auth.extra.raw_info.summary rescue nil),
      image:                (auth.extra.raw_info.pictureUrls.values[1][0] rescue nil),
      phone:                (auth.extra.raw_info.phoneNumbers.values[1][0].phoneNumber rescue nil),
      headline:             (auth.info.headline rescue nil),
      industry:             (auth.info.industry rescue nil),
      date_of_birth:        extract_date(auth.extra.raw_info.dateOfBirth)
      )
    #create_jobs_table(auth, user)
  end

  def create_jobs_table(auth, user)
    byebug
    job_array = auth.extra.raw_info.positions.values[1].nil? ? [] : auth.extra.raw_info.positions.values[1] rescue nil
    if not job_array.nil?
      job_array.each do |job_entry|
        company_name = job_entry.company.name

        company_id = job_entry.company.id
        company_type = job_entry.company.type
        company_ticker = job_entry.company.ticker
        company_industry = job_entry.company.industry

        company = Company.where(name: company_name, linkedin_company_id: company_id, industry: company_industry,
          type: company_type, ticker: company_ticker).first_or_create

        job_title = job_entry.title
        job = Job.where(company: company, position_titlet: job_title).first_or_create

        job_summary = job_entry.summary
        job_id = job_entry.id
        start_date = job_entry.startDate
        if job_entry.isCurrent
          end_date = extra_date(job_entry.endDate)
        else
          end_date = nil
        end
        created_job_experience = JobExperience.new(user: user, company: company, summary: job_summary, start_date: start_date, end_date: end_date)
      end
    end
  end

  def create_education_table(auth, user)
  end

  def create_recommendation_table(auth, user)
  end
end

'''
school_name:          (auth.extra.raw_info.educations.values[1][0].schoolName rescue nil),
grad_year:            (auth.extra.raw_info.educations.values[1][0].endDate.year rescue nil),
interests:            (auth.extra.raw_info.interests rescue nil),
job_bookmarks_count:  (auth.extra.raw_info.jobBookmarks._total rescue nil),
job_total_count:      (auth.extra.raw_info.positions._total rescue nil),
publications_count:   (auth.extra.raw_info.publications._total rescue nil),
recom_count:          (auth.extra.raw_info.recommendationsReceived._total rescue nil),
skills_count:         (auth.extra.raw_info.skills._total rescue nil),
public_prof_url:      (auth.info.urls.public_profile rescue nil),

password:             Devise.friendly_token[0,20],
)
user.skip_confirmation!
user.generate_new_token
user.save(validate: false)
user.unconfirm!
user
end
'''
