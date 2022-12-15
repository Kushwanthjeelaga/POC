require 'rails_helper'

RSpec.describe Note, type: :model do
  subject {FactoryBot.create(:note)}

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

  context "checking the length of the fields" do
    it "title should not be too short" do
      subject.title = 'a' * 0
      expect(subject).to_not be_valid
    end
    
    it "title should not be too long" do
      subject.title = 'a' * 11
      expect(subject).to_not be_valid
    end

    it "description should not be too short" do
      subject.description = 'a' * 0
      expect(subject).to_not be_valid
    end

    it "description should not be too long" do
      subject.description = 'a' * 121
      expect(subject).to_not be_valid
    end
  end
end
