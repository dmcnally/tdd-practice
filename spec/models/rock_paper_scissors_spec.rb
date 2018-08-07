class RockPaperScissors

  def call(player_1:, player_2:)
    @winner = :player_1
    @winner = :player_2 if player_2 == :rock

    self
  end

  def winner
    @winner
  end

end

describe RockPaperScissors do

  describe '#winner' do

    context 'rock beats scissors' do

      it 'returns :player_1 when player_1 is rock and player_2 is scissors' do
        # Arrange
        rps = RockPaperScissors.new

        # Act
        rps.call(player_1: :rock, player_2: :scissors)

        # Assert
        expect(rps.winner).to eq(:player_1)
      end

      it 'returns :player_1 when player_1 is rock and player_2 is scissors' do
        # Arrange
        rps = RockPaperScissors.new

        # Act
        rps.call(player_1: :scissors, player_2: :rock)

        # Assert
        expect(rps.winner).to eq(:player_2)
      end

    end

    context 'scissors beats paper' do

      it 'returns :player_1 when player_1 is scissors and player_2 is paper'
      it 'returns :player_2 when player_1 is paper and player_2 is scissors'

    end

    context 'paper beats rock' do

      it 'returns :player_1 when player_1 is paper and player_2 is rock'
      it 'returns :player_2 when player_1 is rock and player_2 is paper'

    end

  end

end