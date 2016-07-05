class Parcel
  define_method(:initialize) do |height, length, width, weight|
    @cost_factor = { 0 => 6, 1 => 5, 5 => 4, 10 => 3, 20 => 2, 50 => 1}
    @weight_array = [0, 1, 5, 10, 20]
    @costs_array = [6, 5, 4, 3, 2, 1]
    @BaseRate = 5
    @height = height
    @length = length
    @width = width
    @weight = weight
  end

  define_method(:height) do
    @height
  end

  define_method(:length) do
    @length
  end

  define_method(:width) do
    @width
  end

  define_method(:weight) do
    @weight
  end

  define_method(:volume) do
    @height * @width * @length
  end

  define_method(:cost_to_ship) do |distance|
    if distance < 50
      @weight_array.each do |item|
        #puts item.class
        if @weight <= item
           return @weight * @cost_factor[item]
        end
      end
    end
  end
end
