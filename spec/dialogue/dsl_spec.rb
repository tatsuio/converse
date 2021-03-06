RSpec.describe Dialogue::DSL do
  describe "#on" do
    subject { described_class.new }

    before { Dialogue.clear_conversations }

    xit "generates a conversation with an intent" do
      subject.on :blah

      expect(Dialogue.conversations.length).to eq 1
      expect(Dialogue.conversations.first.name).to eq :blah
    end
  end

  describe ".run" do
    let(:block) do
      Proc.new do
        on(:blah) {}
      end
    end

    it "supports an `on` method that defines the intent" do
      expect_any_instance_of(described_class).to receive(:on).with(:blah)

      described_class.run block
    end
  end
end
