require('rspec')
require('parcel')

describe(Parcel) do
  describe('#initialize') do

    it('instantiates a new Parcel object') do
      new_parcel = Parcel.new(1, 2, 3, 4)
      expect(new_parcel.class).to eq(Parcel)
    end

    it('assigns height, width, length, and weight to public variables') do
      new_parcel = Parcel.new(2, 4, 6, 22)
      expect(new_parcel.height).to eq(2)
      expect(new_parcel.length).to eq(4)
      expect(new_parcel.width).to eq(6)
      expect(new_parcel.weight).to eq(22)
    end
  end

  describe('#volume') do
    it('returns the product of the Parcels height, length, and width') do
      new_parcel = Parcel.new(3, 3, 3, 44)
      expect(new_parcel.volume).to eq(27)
    end
  end

  describe('#cost_to_ship') do
    it('returns weight times cost factor if distance is under 50') do
      new_parcel = Parcel.new(3, 3, 3, 1)
      expect(new_parcel.cost_to_ship(49)).to eq(5)
    end

    it('returns weight times one if distance is under 50 and weight is greater than 50') do
      new_parcel = Parcel.new(3, 3, 3, 100)
      expect(new_parcel.cost_to_ship(49)).to eq(100)
    end

    it('return value is weight times cost factor if distance is 50 or less') do
      new_parcel = Parcel.new(3, 3, 3, 1)
      expect(new_parcel.cost_to_ship(50)).to eq(5)
    end

    it('return value is weight times cost factor times 1.1 if distance is greater than 50 but less than or equal to 100') do
      new_parcel = Parcel.new(3, 3, 3, 1)
      expect(new_parcel.cost_to_ship(51)).to eq(5.5)
    end

    it('return value is weight times cost factor times 1.5 if distance is greater than 300') do
      new_parcel = Parcel.new(3, 3, 3, 14)
      expect(new_parcel.cost_to_ship(386)).to eq(42.0)
    end
  end
end
