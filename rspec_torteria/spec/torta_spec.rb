require 'torta'

describe Torta do

  let(:type)  { "milanesa" }
  let(:torta) { Torta.new(type) }

  subject { torta }
  it { is_expected.to respond_to(:type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Torta of the specified type" do
        expect(torta.type).to eq(type)
        expect(torta.time_baked).to eq 0.0
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Torta.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the torta" do
      expect(torta.type).to eq(type)
    end
  end

  describe "#bake!" do
    it "requires an integer time argument" do 
      expect {torta.bake!('s')}.to raise_error(TypeError)
      expect {torta.bake!(true)}.to raise_error(TypeError)
    end

    it "returns the torta object" do
      expect(torta.bake!(10)).to be(torta)
    end

    it "changes the status of the torta when given enough time" do
      expect { torta.bake!(10) }.to change(torta, :status)
    end
  end


  describe "#status" do
    it "returns the torta's current status" do
      expect(torta.status).to be_kind_of(String) 
    end

    context "when unbaked" do
      it "is `crudo`" do
        expect(torta.status).to eq("crudo")
      end
    end

    context "when baked for less than 5 minutes" do
      it "is `crudo`" do
        torta.bake!(4)
        expect(torta.status).to eq("crudo")
        torta.bake!(1)
        expect(torta.status).not_to eq("crudo")
      end
    end

    context "when baked for at least 5 but less than 7 minutes" do
      it "is `casi listo`" do
        torta.bake!(6)
        expect(torta.status).to eq("casi listo")
      end
    end

    context "when baked for at least 7 but less or equal than 10 minutes" do
      it "is `listo`" do
        torta.bake!(9)
        expect(torta.status).to eq("listo")
      end
    end

    context "when baked for at least 11 minutes" do
      it "is `quemado`" do
         torta.bake!(30)
        expect(torta.status).to eq("quemado")
      end
    end
  end

  describe "#bake_time" do
    it "returns bake time of the specified type" do
      expect(torta.bake_time).to be_kind_of(Fixnum) 
      expect(torta.bake_time).to eq(10)
    end
  end
end
