require 'spec_helper'

describe Question do
	before { @question = Question.new(:content => "hey", :user_id => 1)}
	subject { @question}
	describe "should have associations" do
		it { should belong_to(:user)}
		it { should have_many(:answers)}
		it { should have_many(:votes)}
		it { should have_many(:comments)}
	end

	describe "when no content" do
		before { @question.content = ""}
		it {should_not be_valid}
	end
	it { should be_valid }

	it { should respond_to(:content)}
end

