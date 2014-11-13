# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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



