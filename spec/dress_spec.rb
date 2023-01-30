require "dress"

describe Dress do
  let(:new_dress) { Dress.new("title", "type", -10..+10) }

  describe ".new" do
    it "creates an instance" do
      expect(new_dress).to have_attributes(title: "title", type: "type", temperature_range: -10..10)
    end
  end

  let(:file_name) { File.join(__dir__, "fixtures", "01.txt") }
  let(:dress_from_file) { Dress.from_file(file_name) }

  describe ".from_file" do
    it "creates an instance from file" do
      expect(dress_from_file).to have_attributes(title: "Кепка adidas", type: "головной убор", temperature_range: 20..45)
    end
  end

  describe "#suits_the_weather?" do
    context "whether clothes are suitable for appropriate weather" do
      it "return true" do
        expect(dress_from_file.suits_the_weather?(20)).to be true
      end
    end

    context "whether clothes are suitable for inappropriate weather" do
      it "return false" do
        expect(dress_from_file.suits_the_weather?(-20)).to be false
      end
    end
  end

  describe  "#to_s" do
    it "returns a string representation of the instance" do
      expect(dress_from_file.to_s).to eq "Кепка adidas (головной убор) лучше носить, когда за окном 20..45"
    end
  end
end
