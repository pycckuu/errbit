require 'securerandom'

puts "Seeding database"
puts "-------------------------------"

# Create an initial Admin User
admin_username = "pycckuu"
admin_email = "is.markelov@gmail.com"
admin_pass  = ENV["ADMIN_PASS"]

puts "Creating an initial admin user:"
puts "-- username: #{admin_username}" if Errbit::Config.user_has_username
puts "-- email:    #{admin_email}"
puts "-- password: #{admin_pass}"
puts ""
puts "Be sure to note down these credentials now!"

user = User.find_or_initialize_by(:email => admin_email)

user.name = 'Errbit Admin'
user.password = admin_pass
user.password_confirmation = admin_pass
user.username = admin_username if Errbit::Config.user_has_username
user.admin = true
user.save!
