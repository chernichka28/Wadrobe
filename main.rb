require_relative "lib/clothing_collection"

#создаем коллекцию вещей по переданному пути
folder_path = File.join(__dir__, "data")
clothing_collection = ClothingCollection.from_folder(folder_path)

# спрашиваем погоду у пользователя
puts "Сколько градусов за окном? (можно с минусом)"
outside_temperature = $stdin.gets.to_i

# выдаём случайную подходящую вещь каждого типа
puts "Предлагаем сегодня надеть:"
puts "__________________"
puts clothing_collection.suitable_clothes(outside_temperature)
puts "__________________"
