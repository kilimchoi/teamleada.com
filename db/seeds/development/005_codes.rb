if Rails.env.development?
  Code.create(value: "12345678", group: "project-access", user_type: "test")
end
