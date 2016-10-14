describe Eliza::Bot do
  let(:bot) { described_class.new }

  describe '#initial_phrase' do
    subject { bot.initial_phrase }
    it { should match /you/i }
  end

  describe '#final_phrase' do
    subject { bot.final_phrase }
    it { should match /Goodbye/ }
  end
end