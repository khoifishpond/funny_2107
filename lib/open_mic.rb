class OpenMic
  attr_reader :location, :date, :performers

  def initialize(parameters)
    @location = parameters[:location]
    @date = parameters[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    all_jokes = []

    @performers.each do |performer|
      performer.jokes.each { |joke| all_jokes << joke.id }
    end
    
    if all_jokes == all_jokes.uniq
      false
    else
      true
    end
  end
end