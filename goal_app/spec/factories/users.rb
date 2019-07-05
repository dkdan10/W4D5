FactoryBot.define do
  factory(:user) do 
    username { Faker::Twitter.screen_name }
    password { "staten_pete_davidson_island" }
  end
end