FactoryGirl.define do 
	factory :user do
		sequence (:name) { |n| "Diane Uwacu" }
		sequence (:email) { |n| email "diane.uwacu@eagles.oc.edu" }
		password "umuntu"
		password_confirmation "umuntu"

		factory :admin do
			admin true
		end
	end
	factory :micropost do
		content "Lorem ipsum"
		user
	end
end