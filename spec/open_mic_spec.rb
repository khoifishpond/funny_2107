require 'rspec'
require './lib/open_mic'
require './lib/user'
require './lib/joke'

describe OpenMic do
  before(:each) do
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @user_1 = User.new("Sal")
    @user_2 = User.new("Ali")
    @joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  it 'exists' do
    expect(@open_mic).to be_a(OpenMic)
  end

  it 'has a location' do
    expect(@open_mic.location).to eq("Comedy Works")
  end

  it 'has a date' do
    expect(@open_mic.date).to eq("11-20-18")
  end

  it 'starts with no performers' do
    expect(@open_mic.performers).to eq([])
  end

  it 'welcomes peformers' do
    @open_mic.welcome(@user_1)
    @open_mic.welcome(@user_2)

    expect(@open_mic.performers).to eq([@user_1, @user_2])
  end

  it 'determines if performers have the same joke' do
    @open_mic.welcome(@user_1)
    @open_mic.welcome(@user_2)

    @user_2.learn(@joke_1)
    @user_2.learn(@joke_2)

    expect(@open_mic.repeated_jokes?).to eq(false)

    @user_1.learn(@joke_1)

    expect(@open_mic.repeated_jokes?).to eq(true)
  end
end