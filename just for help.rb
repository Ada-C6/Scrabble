describe Card do
# What class you're testing

  describe "#initialize" do
  # Here we put the methods in "#method" format
    card = Card.new("suit",1)
    # So you don't have to keep writing the above line over and over again in the following "describes"

    it "can create a new instance of Card" do
    # Make this as specific to the test it can be, aka it really describes what the test is testing
      card.must_be_instance_of(Card)
      # We "run the method" here, aka def initialize is also Card.new(parameters)
    end

    it "should have a suit property" do
    # Note: these tests will be run in random order
      card.must_respond_to(:suit)
    end

    it "should have a value property" do
      card.must_respond_to(:value)
    end

    it "first initialize parameter must be \"suit\"" do
      card.suit.must_equal("suit")
      # the first "suit" in above line is the instance variable
    end

    it "second initialize parameter must be \"1\"" do
      card.value.must_equal(1)
    end
  end
end
