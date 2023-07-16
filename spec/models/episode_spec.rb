require "rails_helper"

RSpec.describe Episode, type: :model do

  let(:episode) { create(:episode) }

  context "it validates the presence of attributes" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:plot) }

    it { should validate_presence_of(:number) }

  end

  context "it validates the uniqueness of attributes" do

    subject { create(:episode) }

    it { should validate_uniqueness_of(:title).scoped_to(:season_id) }

    it { should validate_uniqueness_of(:number).scoped_to(:season_id) }

  end

  context "it has relationship with others models" do

    it { should belong_to(:season) }

  end

end
