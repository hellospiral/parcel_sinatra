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
  end
end
