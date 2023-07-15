require 'rails_helper'

RSpec.describe Season, type: :model do

  before(:each) do
    Season.delete_all
  end

  subject {
    Season.new(
      title: "Game of Thrones",
      plot: "Nine noble families fight for control over the mythical lands of Westeros.",
      number: 5
    )
  }

  context "It has attributes" do

    it 'return the season title' do
      expect(subject.title).to eq('Game of Thrones')
    end

    it 'return the season plot' do
      expect(subject.plot).to eq('Nine noble families fight for control over the mythical lands of Westeros.')
    end

    it 'return the season number' do
      expect(subject.number).to eq(5)
    end

  end

  context "it validates the presence of attributes" do

    it 'is not valid without a title' do
      season = Season.new(title: nil)
      expect(season).to_not be_valid
    end

    it 'is not valid without a plot' do
      season = Season.new(plot: nil)
      expect(season).to_not be_valid
    end

    it 'is not valid without a number' do
      season = Season.new(number: nil)
      expect(season).to_not be_valid
    end

  end

  context "it validates the uniqueness of attributes" do

    it "is not valid with a duplicate title" do
      Season.create!(
        title: "The Game of Thrones",
        plot: "Nine noble families fight for control over the mythical lands of Westeros.",
        number: 5)
      expect(subject).to_not be_valid
    end

    it "is not valid with a duplicate number" do
      season = Season.create!(
        title: "Another show",
        plot: "Diferent plot",
        number: 5
      )
      expect(subject).to_not be_valid
    end

  end

  context "it has a relationship with other models" do

    it "has many episodes" do
      should respond_to(:episodes)
    end

    it "has many purchases" do
      should respond_to(:purchases)
    end

    it "has many users" do
      should respond_to(:users)
    end

  end


  # { should have_many(:episodes).dependent(:destroy) }

  # it { should have_many(:purchases).dependent(:destroy) }

end
