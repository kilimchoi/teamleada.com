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

  def self.extract_date(date_hash)
    Date.new((date_hash.year rescue nil), (date_hash.month rescue nil), (date_hash.day rescue nil).nil? ? 1 : date_hash.day) rescue nil
  end

  def self.new_with_linked_in_params(auth)
    byebug
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
      date_of_birth:        self.extract_date(auth.extra.raw_info.dateOfBirth),
      password:             Devise.friendly_token[0,20],
      )

      user.skip_confirmation!
      user.generate_new_token
      user.save(validate: false)
      user.unconfirm!

    create_jobs_table(auth, user)
    create_education_table(auth, user)
    create_recommendation_table(auth, user)
    create_publication_table(auth, user)
    create_skill_table(auth, user)
    return user
  end

  def self.create_jobs_table(auth, user)
    byebug
    job_array = auth.extra.raw_info.positions.values[1].nil? ? [] : auth.extra.raw_info.positions.values[1] rescue nil
    if not job_array.nil?
      job_array.each do |job_entry|
        company_name = job_entry.company.name rescue nil

        company_id = job_entry.company.id.to_s rescue nil
        company_type = job_entry.company.type.to_s rescue nil
        company_ticker = job_entry.company.ticker.to_s rescue nil
        company_industry = job_entry.company.industry.to_s rescue nil

        company = Company.where(name: company_name, linkedin_company_id: company_id, industry: company_industry,
          company_type: company_type, ticker: company_ticker).first_or_create

        job_title = job_entry.title
        job = Job.where(company: company, position_title: job_title).first_or_create

        job_summary = job_entry.summary.to_s
        job_id = job_entry.id.to_s
        start_date = self.extract_date(job_entry.startDate)
        if not job_entry.isCurrent
          end_date = self.extract_date(job_entry.endDate)
        else
          end_date = nil
        end

        created_job_experience = JobExperience.where(user: user, summary: job_summary, start_date: start_date, end_date: end_date).first_or_create
        created_job_experience.job = job
        created_job_experience.save
      end
    end
  end

  def self.create_education_table(auth, user)
    byebug
    education_array = auth.extra.raw_info.educations.values[1].nil? ? [] : auth.extra.raw_info.educations.values[1] rescue nil
    if not education_array.nil?
      education_array.each do |education_entry|

        education_institute_name = education_entry.schoolName rescue nil
        education_linkedin_id = education_entry.id rescue nil
        university = University.where(name: education_institute_name).first_or_create
        if university.linkedin_school_id.nil?
          university.update(linkedin_school_ud: education_linkedin_id)
          university.save
        end

        education_degree = education_entry.degree rescue nil
        education_field_of_study = education_entry.fieldOfStudy rescue nil
        education_start_date = self.extract_date(education_entry.startDate) rescue nil
        education_end_date = self.extract_date(education_entry.endDate) rescue nil
        education_activities = education_entry.activities rescue nil
        education_notes = education_entry.notes rescue nil
        enrollment = Enrollment.where(user: user, university: university, field_of_study: education_field_of_study).first_or_create
        enrollment.update(degree: education_degree, start_date: education_start_date, end_date: education_end_date, 
                          notes: education_notes, activities: education_activities)
        enrollment.save
      end
    end
  end

  def self.create_recommendation_table(auth, user)
    byebug
    rec_array = auth.extra.raw_info.recommendationsReceived.values[1].nil? ? [] : auth.extra.raw_info.recommendationsReceived.values[1] rescue nil
    if not rec_array.nil?
      rec_array.each do |rec_entry|
        rec_giver_first = rec_entry.recommender.firstName.to_s
        rec_giver_last = rec_enrtry.recommender.lastName.to_s
        rec_giver_linkedin_id = rec_entry.recommender.id.to_s
        
        rec_text = rec_entry.recommender.recommendationText.to_s
        rec_type = rec_entry.recommender.recommendationType.to_s
        rec_id = rec_entry.id.to_s

        recommendation = JobRecommendation.where(reviewer_first_name: rec_giver_first, reviewer_last_name: rec_giver_last,
                                                 reviewer_linkedin_id: rec_giver_linkedin_id, reviewee: user).first_or_create
        recommendation.update(recommendation_type: rec_type, body: rec_text)
        recommendation.save
      end
    end
  end

  def self.create_publication_table(auth, user)
    byebug
    publication_array = auth.extra.raw_info.publications.values[1].nil? ? [] : auth.extra.raw_info.publications.values[1] rescue nil
    if not publication_array.nil?
      publication_array.each do |pub_entry|
        publication_date = self.extract_date(pub_entry.date)
        publication_title = pub_entry.title.to_s rescue nil
        publication_publisher = pub_entry.publisher.to_s rescue nil
        publication_description = pub_entry.summary.to_s rescue nil
        publication_id = pub_entry.id.to_s rescue nil
        
        publication = Publication.where(user: user, publication_id: publication_id)
        publication.update(title: publication_title, description: publication_description, publication_date: publication_date, 
                           publisher: publication_publisher)
        publication.save
      end
    end
  end

  def self.create_skill_table(auth, user)
    byebug
    skills_array = auth.extra.raw_info.skills.values[1].nil? ? [] : auth.extra.raw_info.skills.values[1] rescue nil
    if not skills_array.nil?
      skills_array.each do |skill_entry|
        skill_id = skill_entry.id.to_s rescue nil
        skill_name = skill_entry.skill.name.to_s rescue nil

        skill = Skill.where(skill_name: skill_name, skill_id: skill_id).first_or_create
        user_skill = UserSkill.where(user: user, skill: skill).first_or_create
      end
    end
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
