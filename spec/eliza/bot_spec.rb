describe Eliza::Bot do
  let(:bot) { described_class.new }

  describe '#initial_phrase' do
    subject { bot.initial_phrase }
    it { should_not be_empty }
  end
end