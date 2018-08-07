require 'pry'

class FizzBuzz

  DEFAULT_CONFIG = {
      fizz_buzz: [ 3, 5 ],
      fizz: [ 3 ],
      buzz: [ 5 ]
    }

  def initialize(config: DEFAULT_CONFIG)
    @config = config
  end

  def call(range)
    range.map { |value| to_fizz_buzz(value) }
  end

  private

  attr_reader :config

  def to_fizz_buzz(value)
    config.each do |output, values|
      remainder = values.map{|divisor| value % divisor }.sum
      return output if remainder == 0
    end

    value
  end

end


describe FizzBuzz do

  context 'fizz_buzz_bang' do

    it 'returns :fizz_buzz_bang when the number is divisable by 3, 5 and 10' do
      # Arrange
      fizz_buzz_bang_config = {
                                fizz_buzz_bang: [ 3, 5, 10 ],
                                fizz_buzz: [ 3, 5 ],
                                fizz: [ 3 ],
                                buzz: [ 5 ]
                              }


      fizz_buzz = FizzBuzz.new(config: fizz_buzz_bang_config)

      # Act
      result = fizz_buzz.call(30..30)

      # Asset
      expect(result).to eq( [ :fizz_buzz_bang ] )
    end

  end

  context 'traditional' do

    it 'returns the number when the number is not divisable by 3 or 5' do
      # Arrange
      fizz_buzz = FizzBuzz.new

      # Act
      result = fizz_buzz.call(1..2)

      # Asset
      expect(result).to eq( [ 1, 2 ] )
    end

    it 'returns :fizz for the numbers divisable by 3' do
      # Arrange
      fizz_buzz = FizzBuzz.new

      # Act
      result = fizz_buzz.call(3..3)

      # Asset
      expect(result).to eq( [ :fizz ] )
    end

    it 'returns :buzz for the numbers divisable by 5' do
      # Arrange
      fizz_buzz = FizzBuzz.new

      # Act
      result = fizz_buzz.call(5..5)

      # Asset
      expect(result).to eq( [ :buzz ] )
    end

    it 'returns :fizz_buzz for the numbers divisable by 3 and 5' do
      # Arrange
      fizz_buzz = FizzBuzz.new

      # Act
      result = fizz_buzz.call(15..15)

      # Asset
      expect(result).to eq( [ :fizz_buzz ] )
    end

    it 'returns the correct values for a range of numbers' do
      # Arrange
      fizz_buzz = FizzBuzz.new

      # Act
      result = fizz_buzz.call(1..20)

      # Asset
      expect(result).to eq( [
                              1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz,
                              11, :fizz, 13, 14, :fizz_buzz, 16, 17, :fizz, 19, :buzz
                            ] )
    end

  end

end