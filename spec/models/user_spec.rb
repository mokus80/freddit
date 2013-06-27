# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  email                 :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  remember_token        :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "should fail validation when the email address is not correctly formed" do
    before  { @user.email = "name.com"}
    it { should_not be_valid }
  end

end
