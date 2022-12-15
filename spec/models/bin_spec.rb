require 'rails_helper'

RSpec.describe Bin, type: :model do
  subject {FactoryBot.create(:bin)}

  context "data should be present" do
    it "title should be present" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "director should be present" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end