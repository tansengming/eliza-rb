describe Eliza::Sentence do
  before { Eliza.config.reset }
  let(:sentence) { described_class.new text }

  describe '#transform' do
    subject { sentence.transform }
    context 'when input does need a replacement answer' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-basic.yml' } }

      let(:text) { "So sorry about that." }
      it { should eq "Please don't apologise." }
    end

    context 'when input has a quit word' do
      let(:text) { 'Bye! its been good talking to you.' }
      it { should match /Goodbye/ }
    end
  end  
end