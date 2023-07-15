require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    User.new(
      id: 1,
      email: "rita@example.com",
      created_at: "2020-01-01 00:00:00",
      updated_at: "2020-01-01 00:00:00"
    )
  }

  it 'return the user email' do
    expect(subject.email).to eq('rita@example.com')
  end

  it "has many purchases" do
    should respond_to(:purchases)
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    User.create!(
      email: "rita@example.com"
    )
    expect(subject).to_not be_valid
  end

end
