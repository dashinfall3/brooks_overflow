require 'spec_helper'

describe User do
	let(:user) { User.new(:email => "hey@aol.com", :username => "word33", :password => "hey333")  } 

	describe "validate user associations" do
		it { should have_many(:questions)}
		it { should have_many(:answers)}
		it { should have_many(:votes)}
	end

	it { should respond_to(:username)}
	it { should respond_to(:email)}

	describe "does not allow short lengths" do
		it { should_not allow_value("blah").for(:email)}
		it { should_not allow_value("uhoh").for(:password)}
		it { should_not allow_value("blah").for(:username)}
	end

	it { should be_valid }

	describe "when username is not present" do
		before { user.username = " "}
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { user.email = " "}
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com]
			addresses.each do |invalid_address|
				user.email = invalid_address
				user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it   "should be valid" do
			addresses = %w[user@foo.com]
			addresses.each do |valid_address|
				user.email = valid_address
				user.should be_valid
			end
		end
	end

	describe "when user has duplicate email" do
		it "should not b evalid" do 
		end
	end

end

