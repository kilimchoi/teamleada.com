if Rails.env.development?
  Code.create(value: "12345678", access_type: "project-access", user_type: "test")
end
