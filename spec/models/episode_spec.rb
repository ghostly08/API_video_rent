require "rails_helper"

RSpec.describe Episode, type: :model do

  before(:each) do
    Episode.delete_all
    Season.delete_all
  end

  let(:season) { Season.create!(title: "Game of Thrones", plot: "Nine noble families fight for control over the mythical lands of Westeros.", number: 5) }

  subject {
    Episode.new(
      title: "Winter Is Coming",
      plot: "Eddard Stark is torn between his family and an old friend.",
      number: 1,
      season: season
    )
  }

  context "It has attributes" do

    it 'return the episode title' do
      expect(subject.title).to eq('Winter Is Coming')
    end

    it 'return the episode plot' do
      expect(subject.plot).to eq('Eddard Stark is torn between his family and an old friend.')
    end

    it 'return the episode number' do
      expect(subject.number).to eq(1)
    end

  end

  context "it validates the presence of attributes" do

    it 'is not valid without a title' do
      episode = Episode.new(title: nil)
      expect(episode).to_not be_valid
    end

    it 'is not valid without a plot' do
      episode = Episode.new(plot: nil)
      expect(episode).to_not be_valid
    end

    it 'is not valid without a number' do
      episode = Episode.new(number: nil)
      expect(episode).to_not be_valid
    end

  end

  context "it validates the uniqueness of attributes" do

    it "is not valid with a duplicate title" do
      Episode.create!(
        title: "Winter Is",
        plot: "Eddard Stark is torn between his family and an old friend.",
        number: 1,
        season: season
      )

      expect(subject).to_not be_valid
    end

    it "is not valid with a duplicate number" do
      Episode.create!(
        title: "Winter Is Coming",
        plot: "Eddard Stark is torn between his family and an old friend.",
        number: 1,
        season: season
      )

      expect(subject).to_not be_valid
    end

  end

  context "it has relationship with others models" do

    it "belongs to a season" do
      expect(subject.season).to eq(season)
    end

  end

end
