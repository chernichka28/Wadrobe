require_relative "dress"

class ClothingCollection
  attr_accessor :clothes_hash

  def initialize(clothes_hash)
    @clothes_hash = clothes_hash
  end

  def self.from_folder(folder_path)
    file_names = Dir[File.join(folder_path, "*.txt")]
    clothes_hash = {}

    #идём по названиям, создаём хэш, у которого ключи - типы одежды, а значения массивы с экземплярами одежды
    file_names.each do |file_name|
      dress = Dress.from_file(file_name)

      #если у этого ключа значение nil, то в его значение передадим пустой массив
      clothes_hash[dress.type] ||= []
      clothes_hash[dress.type] << dress
    end

    new(clothes_hash)
  end

  def suitable_clothes(temperature)
    suitable_clothes = []
    clothes_hash.each do |type, type_clothes|
      #набираем в массив по каждому типу одежды подходящую
      suitable_type_clothes = (type_clothes.select { |dress| dress.suits_the_weather?(temperature) })
      suitable_clothes << suitable_type_clothes.sample unless suitable_type_clothes.empty?
    end
    suitable_clothes
  end

end
