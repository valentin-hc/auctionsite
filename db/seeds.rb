puts "________________Destroying all users and creating new dummy users___________________________"
User.destroy_all

(1..5).each do |i|
	User.create(name: "user#{i}", email: "user#{i}@supermail.com", password: "bob")
end