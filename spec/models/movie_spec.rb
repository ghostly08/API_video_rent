require 'rails_helper'

RSpec.describe Movie, type: :model do

  before(:each) do
    Movie.delete_all
  end

  subject {
    Movie.new(
      id: 1,
      title: "The Matrix",
      plot: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
      created_at: "2020-01-01 00:00:00",
      updated_at: "2020-01-01 00:00:00"
    )
  }

  context "It has attributes" do

    it 'return the movie title' do
      expect(subject.title).to eq('The Matrix')
    end

    it 'return the movie plot' do
      expect(subject.plot).to eq('A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.')
    end

  end

  context "it has associations with others models" do

    it "has many purchases" do
      should respond_to(:purchases)
    end

    it "has many users" do
      should respond_to(:users)
    end

  end

  context "it validates the presence of attributes" do

    it 'is not valid without a title' do
      movie = Movie.new(title: nil)
      expect(movie).to_not be_valid
    end

    it 'is not valid without a plot' do
      movie = Movie.new(plot: nil)
      expect(movie).to_not be_valid
    end

  end

  context "it validates the uniqueness of attributes" do

    it "is not valid with a duplicate title" do
      Movie.create!(
        title: "The Matrix",
        plot: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
      )
      expect(subject).to_not be_valid
    end

  end

end
