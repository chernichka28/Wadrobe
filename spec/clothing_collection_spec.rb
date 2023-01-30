require "dress"
require "clothing_collection"

describe ClothingCollection do
  let(:clothes) { ClothingCollection.new({ type: "dress_instance" }) }

  describe ".new" do
    it "creates an instance" do
      expect(clothes).to have_attributes(clothes_hash: {type: "dress_instance"})
    end
  end

  let(:folder_path) { File.join(__dir__, "fixtures") }
  let(:clothes_from_folder) { ClothingCollection.from_folder(folder_path) }

  describe ".from_folder" do
    it "create instance from folder" do
      expect(clothes_from_folder).to have_attributes(clothes_hash: {"головной убор" => clothes_from_folder.clothes_hash["головной убор"]})
    end
  end

  describe "#suitable_clothes" do
    it "return array of suitable dresses" do
      expect(clothes_from_folder.suitable_clothes(20)).to eq clothes_from_folder.clothes_hash["головной убор"]
    end
  end
end
