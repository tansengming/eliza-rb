describe Eliza::Bot do
  let(:bot) { described_class.new }

  describe '#transform' do
    subject { bot.transform input }

    context 'when input has a quit word' do
      let(:input) { 'Bye! its been good talking to you.' }
      it { should match /Goodbye/ }
    end
  end

  describe '#initial_phrase' do
    subject { bot.initial_phrase }
    it { should match /you/i }
  end

  describe '#final_phrase' do
    subject { bot.final_phrase }
    it { should match /Goodbye/ }
  end
end