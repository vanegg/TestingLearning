require 'laying_hen'

describe LayingHen do
  # LayingHen tests here
  let(:hatched_hours) {2}
  let(:egg) {Egg.new(:hatched_hours)}

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Egg" do
        expect(egg).to be_an_instance_of Egg
      end
    end

    context "with invalid input" do
      it "throws an error if Egg doesn't have hatched hours" do
        expect{Egg.new()}.to raise_error(ArgumentError)
      end
    end
  end

  describe "#rotten?" do
    contex "rotten eggs is false" do
      it "rotten is false" do
        expect(egg.rotten?).to eq(false)
      end
    end
  end

end

describe Egg do
  # Egg tests here

end
