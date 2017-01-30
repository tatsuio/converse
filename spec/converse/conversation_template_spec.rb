RSpec.describe Converse::ConversationTemplate do
  describe ".build" do
    it "returns a new instance of a template" do
      expect(described_class.build).to be_kind_of Converse::ConversationTemplate
    end

    it "creates a new template each time" do
      run1 = described_class.build
      run2 = described_class.build

      expect(run1).to_not eq run2
    end

    it "can be initialized with a block" do
      proc = Proc.new {}

      subject = described_class.build &proc

      expect(subject.template).to eq proc
    end

    it "does not run the block" do
      ran = false
      proc = Proc.new { ran = true }

      subject = described_class.build &proc

      expect(ran).to eq false
    end

    it "takes in an optional thread name" do
      expect(described_class.build(:thread_one).name).to eq :thread_one
    end
  end
end
