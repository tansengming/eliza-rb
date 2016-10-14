describe Eliza::Bot do
  let(:bot) { described_class.new }

  describe '#initial_phrase' do
    subject { bot.initial_phrase }
    it { should_not be_empty }
  end

  describe '#final_phrase' do
    subject { bot.final_phrase }
    it { should_not be_empty }
  end
end