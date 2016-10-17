describe Eliza::Input do
  let(:input) { described_class.new text }

  describe '#sentences' do
    subject { input.sentences }

    context 'when there is only a sentence' do
      let(:text) { 'Hello.' }
      its(:size) { should eq 1 }
    end

    context 'when there is question marks' do
      let(:text) { "Hello? Is it me you're looking for" }
      its(:size) { should eq 2 }
    end

    context 'when there is a but' do
      let(:text) { "I like you but you are a bit annoying." }
      its(:size) { should eq 2 }
    end
  end
end