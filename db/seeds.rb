# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
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
=end

PrimaryTopic.create([ {name: "Program"}, { name: "Personal Coaching" },{ name: "24/7 Chat" },{ name: "Tech" } ])

SecondaryTopic.create([ { name: "Program Materials", primary_topic_id: 1 },
						{ name: "PointsPlus Program", primary_topic_id: 1 },
						{ name: "Management/Nutrition", primary_topic_id: 1 },
						{ name: "Diet/Medical Needs", primary_topic_id: 1 },
						{ name: "eTools", primary_topic_id: 1 },
						{ name: "Mobile App", primary_topic_id: 1 },
						{ name: "Online Membership", primary_topic_id: 1 },
						{ name: "Coach Tools", primary_topic_id: 2 },
						{ name: "Policies", primary_topic_id: 2 },
						{ name: "Coach Tools", primary_topic_id: 3 },
						{ name: "Policies", primary_topic_id: 3 },
						{ name: "Platform Set Up", primary_topic_id: 4 }
					 ])


Subtopic.create([ { name: "Member Materials (new for 2015)", secondary_topic_id: 1 },
					{ name: "Member Materials (unchanged)", secondary_topic_id: 1 },
					{ name: "PointsPlus Tutorial", secondary_topic_id: 2 },
					{ name: "DPT", secondary_topic_id: 2 },
					{ name: "PPVs", secondary_topic_id: 2 },
					{ name: "Good Health Guidelines", secondary_topic_id: 2 },
					{ name: "Goal Weight", secondary_topic_id: 2 },
					{ name: "Power Foods List", secondary_topic_id: 2 },
					{ name: "Lifetime Membership", secondary_topic_id: 2 },
					{ name: "Safe Rate of Weight Loss", secondary_topic_id: 2 },
					{ name: "Food/Beverages", secondary_topic_id: 2 },
					{ name: "Nursing Moms", secondary_topic_id: 2 },
					{ name: "Young People", secondary_topic_id: 2 },
					{ name: "Activity", secondary_topic_id: 2 },
					{ name: "Simply Filling", secondary_topic_id: 2 },
					{ name: "Understanding Body Weight", secondary_topic_id: 3 },
					{ name: "Nutrition Basics", secondary_topic_id: 3 },
					{ name: "Cooking Techniques", secondary_topic_id: 3 },
					{ name: "Stocking the Kitchen", secondary_topic_id: 3 },
					{ name: "Eating Out", secondary_topic_id: 3 },
					{ name: "Activity", secondary_topic_id: 3 },
					{ name: "Menopause", secondary_topic_id: 3 },
					{ name: "Aging", secondary_topic_id: 3 },
					{ name: "Smoking Cessation", secondary_topic_id: 3 },
					{ name: "Plateaus", secondary_topic_id: 3 },
					{ name: "Gluten Free", secondary_topic_id: 4 },
					{ name: "Vegetarians", secondary_topic_id: 4 },
					{ name: "Men", secondary_topic_id: 4 },
					{ name: "Diabetes", secondary_topic_id: 4 },
					{ name: "Description of Product", secondary_topic_id: 8 },
					{ name: "Role of Personal Coach", secondary_topic_id: 8 },
					{ name: "Call Scripts", secondary_topic_id: 8 },
					{ name: "Coach FAQs", secondary_topic_id: 9 },
					{ name: "Member FAQS", secondary_topic_id: 9 },
					{ name: "Cancellation Process", secondary_topic_id: 9 },
					{ name: "Definition of Product", secondary_topic_id: 10 }, # start Chat Coach Tools 
					{ name: "Role of 24/7 Chat Coach", secondary_topic_id: 10 },
					{ name: "Chat Scripts", secondary_topic_id: 10 },
					{ name: "Member FAQs", secondary_topic_id: 10 },
					{ name: "Member Links", secondary_topic_id: 10 },
					{ name: "Transfer Process", secondary_topic_id: 11 },
					{ name: "Escalation Process", secondary_topic_id: 11 },
					{ name: "Chat Platform", secondary_topic_id: 12 },
					{ name: "Personal Coaching Platform", secondary_topic_id: 12 }
				])



