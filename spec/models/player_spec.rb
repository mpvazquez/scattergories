require 'spec_helper'

describe Player do
  it "creates a new player" do
    jenn_dood = Player.create!

    expect(jenn_dood.id).to be_true
  end
end
