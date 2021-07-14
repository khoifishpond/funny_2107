require 'rspec'
require './lib/joke'

describe Joke do
  before(:each) do
    @joke = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  it 'exists' do
    expect(@joke).to be_a(Joke)
  end

  it 'has an id' do
    expect(@joke.id).to eq(22)
  end

  it 'has a setup' do
    expect(@joke.setup).to eq("Why did the strawberry cross the road?")
  end

  it 'has a punchline' do
    expect(@joke.punchline).to eq("Because his mother was in a jam.")
  end
end