class Parcel
  define_method(:initialize) do |height, length, width, weight|
    @cost_factor = { 0 => 6, 1 => 5, 5 => 4, 10 => 3, 20 => 2, 50 => 1}
    @weight_array = [0, 1, 5, 10, 20, 50]
  #  @costs_array = [6, 5, 4, 3, 2, 1]
    @distance_array = [50, 100, 150, 200, 250, 300]
    @distance_factor = {50 => 1, 100 => 1.1, 150 => 1.2, 200 => 1.3, 250 => 1.4, 300 => 1.5 }
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
    weight_index = 0
    if @weight > @weight_array.last
      weight_index = @cost_factor[@weight_array.last]
    else
      @weight_array.each do |item|
        if @weight <= item
           weight_index = @cost_factor[item]
           break
        # else
        #   "weight_factor didn't get set"
        end
      end
    end
    if distance > @distance_array.last()
      distance_factor = @distance_factor[@distance_array.last()]
    else
      @distance_array.each do |value|
        if distance <= value # this will be true every time through the loop
          distance_factor = @distance_factor[value]
          break
        end
      end
    end
    @weight * weight_index * distance_factor
  end
end
