require 'spec_helper'

FactoryGirl.define do
	factory :user do
		sequence(:username) {|n| "username#{n}"}
		sequence(:email) 		{|n| "email#{n}@factory.com" }
		password "wordup"
	end
end

FactoryGirl.define do
	factory :question do 
		content "whatupwhatupwhatup"
		user
	end
end

describe QuestionsController do

	let(:question) { create(:question) }
	let(:user) { create(:user) }
	before(:each) do
		controller.stub!(:current_user).and_return(user)
	end
	describe "GET #show" do
		it "assigns the requested user to @user" do
			get :show, id: question
			assigns(:question).should eq(question)
		end
		it "renders the #show view" do
			get :show, id: question
			response.should render_template :show
		end
	end

	describe "GET #new" do
		it "assigns the requested question to @question" do
		
			get :new
			assigns(:question).should be_a_new(Question)
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new question in the database" do
				
				expect{
					post :create, question: attributes_for(:question)
				}.to change(Question,:count).by(1)
			end
			it "redirects to the show template" do
				post :create, question: attributes_for(:question)
				response.should redirect_to Question.last
			end
		end
	end

	# 	context "with invalid attributes" do
	# 		it "does not save the new contact in the database" do
	# 			expect{
	# 				post :create, question: FactoryGirl.attributes_for(:invalid_question)
	# 			}.to_not change(Question,:count)
	# 		end
	# 		it "re-renders the :new template" do
	# 			post :create, question: FactoryGirl.attributes_for(:invalid_question)
	# 			response.should render_template :new
	# 		end
	# 	end
	# end
end

