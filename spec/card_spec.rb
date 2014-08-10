require "rspec"
require "card"

describe Card do
	it "is initialized with a unique rank and suit combination" do
		test_card = Card.new({:rank=>"2",:suit=>"Clubs"})
		expect(test_card).to be_an_instance_of Card
	end

	it "can tell you its rank and suit" do
		test_card = Card.new({:rank=>"2",:suit=>"Clubs"})
		expect(test_card.rank).to eq "2"
		expect(test_card.suit).to eq "Clubs"
	end

end
