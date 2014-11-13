# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(employee_id: 1234567, jive_user_id: 14, username: "TaylorSeed")
r = Random.new(4444)
tab_types = ["MM", "Bootstrap"]

99.times do |n|
	username = Faker::Name.name
	employee_id = Faker::Number.number(7)
	jive_user_id = r.rand(1..1000)
	user = User.create!(username: username, jive_user_id: jive_user_id, employee_id: employee_id)

	user_id = r.rand(1..99)
	start_time = Time.now+r.rand(1..10000)
	default_end = Time.now+420
	end_time = Time.at((default_end.to_f - start_time.to_f)*rand + start_time.to_f)
	c = Call.create!(user_id: user.id, start_time: start_time, end_time: end_time, ended: true)
	num_clicks = r.rand(0..10)
	for i in 0..num_clicks
		click = Click.new(call_id: c.id, user_id: c.user_id)
		index = r.rand(0..2)
		case index
		when 0
			action = Tab.new(name: Faker::Lorem.words(1), tab_type: tab_types[r.rand(0..1)])
		when 1
			num = r.rand(1000...1300).to_s
			tc = [true, false].sample
			action = Doc.new(title: Faker::Lorem.words(4), doc_num: "DOC-"+num, tab_click: tc)
		when 2
			action = Search.new(subject: Faker::Lorem.words(r.rand(1..10)))
		end
		action.click = click
		click.action = action
		click.save
		action.save
	end # end while loop
end