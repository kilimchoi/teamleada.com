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
    (auth.info.industry rescue nil).nil? ? nil : registered_user.update(indutry: auth.info.industry)
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

  def new_with_linked_in_params(auth)
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
      indutry:              (auth.info.industry rescue nil),
      public_prof_url:      (auth.info.urls.public_profile rescue nil),

      date_of_birth:        (Date.new((auth.extra.raw_info.dateOfBirth.year rescue nil), (auth.extra.raw_info.dateOfBirth.month rescue nil), (auth.extra.raw_info.dateOfBirth.day rescue nil)) rescue nil),
      school_name:          (auth.extra.raw_info.educations.values[1][0].schoolName rescue nil),
      grad_year:            (auth.extra.raw_info.educations.values[1][0].endDate.year rescue nil),
      interests:            (auth.extra.raw_info.interests rescue nil),
      job_bookmarks_count:  (auth.extra.raw_info.jobBookmarks._total rescue nil),
      job_total_count:      (auth.extra.raw_info.positions._total rescue nil),
      publications_count:   (auth.extra.raw_info.publications._total rescue nil),
      recom_count:          (auth.extra.raw_info.recommendationsReceived._total rescue nil),
      skills_count:         (auth.extra.raw_info.skills._total rescue nil),

      password:             Devise.friendly_token[0,20],
    )
    user.skip_confirmation!
    user.generate_new_token
    user.save(validate: false)
    user.unconfirm!
    user
  end

end
