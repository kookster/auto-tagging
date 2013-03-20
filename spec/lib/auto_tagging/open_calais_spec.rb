require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "AutoTagging::OpenCalais::Main" do
  describe "#get_tags" do
    let(:main) { AutoTagging::OpenCalais::Main.new(key) }

    context "invalid key" do
      let(:key) { 'invalid_key' }

      it "should return an empty array" do
        main.get_tags(long_content).should == []
      end
    end

    context "valid key" do
      let(:key) { "vcpghu34sh4exhrgx6nvetfg" }

      context "with no content" do
        it "should return an empty array" do
          main.get_tags(empty_content).should == []
        end
      end

      context "with content" do
        context "short content" do
          it "should return an empty array" do
            main.get_tags(short_content).should == []
          end
        end

        context "valid content" do
          it "should return an array" do
            main.get_tags(long_content).should_not be_empty
          end
        end
      end
    end
  end
end
