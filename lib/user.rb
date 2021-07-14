class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def joke_by_id(id)
    a_joke = @jokes.filter { |joke| joke.id == id }
    a_joke.first
  end
end