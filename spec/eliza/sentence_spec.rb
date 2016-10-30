describe Eliza::Sentence do
  before { Eliza.config.reset }
  let(:sentence) { described_class.new text }

  describe '#transform' do
    subject { sentence.transform }

    context 'when there is a replacement rule' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-rule.yml' } }

      let(:text) { "I think I remember that bloody day" }
      it { should eq "Do you often think of that bloody day?" }
    end

    context 'when there is are replacement rules' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-rules.yml' } }

      let(:text) { "do you remember that time in Bruges" }
      it { should eq "Did you think I would forget that time in bruges?" }

      context 'when the replacement includes a pronoun' do
        let(:text) { "I can't really sleep at night anymore" }
        it { should eq "Do you say you can't really sleep at night anymore for some special reason?" }
      end
    end

    context 'when only the grab all rule matches' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-rules.yml' } }

      let(:text) { "remember remember the fifth of november" }
      it { should eq "Of course I remember" }
    end

    context 'when the rules are missing' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-no-rules.yml' } }

      let(:text) { "do you remember that time in Bruges" }
      it 'should raise a custom error' do
        expect { subject }.to raise_error "Could not find rules for 'remember'!"
      end
    end

    context 'when the default rule has a replacement' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-rules.yml' } }

      let(:text) { "well I was listening to this song and she talked about it" }
      it { should eq "Do you say well you were listening to this song and she talked about it for some special reason?" }
    end

    context 'when there are no replacement rules' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-basic.yml' } }

      let(:text) { "So sorry about that." }
      it { should eq "Please don't apologise." }
    end

    context 'when there are multiple keywords' do
      before { Eliza.configure {|config| config.data_path = 'spec/fixtures/data-rank.yml' } }

      let(:text) { "Sorry but what is your name" }
      it { should eq "I am not interested in names." }
    end

    context 'when input has a quit word' do
      let(:text) { 'Bye! its been good talking to you.' }
      it { should match /Goodbye/ }
    end

    context 'when the quit word is part of another word' do
      let(:text) { 'I liked rockabye baby' }
      it { should_not match /Goodbye/ }
    end
  end  
end