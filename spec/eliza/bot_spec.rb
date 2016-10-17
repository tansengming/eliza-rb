describe Eliza::Bot do
  before { Eliza.config.reset }
  let(:bot) { described_class.new }

  describe '#transform' do
    subject { bot.transform input }
    context 'when input has a quit word' do
      let(:input) { 'Bye! its been good talking to you.' }
      it { should match /Goodbye/ }
    end

    context 'when there are not keywords' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-basic.yml' } }
      let(:input) { 'no keywords' }
      it { should eq "I'm not sure I understand you fully." }
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