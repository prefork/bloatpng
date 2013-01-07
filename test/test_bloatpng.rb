require 'helper'

class TestBloatpng < Test::Unit::TestCase
  context "bloatpng" do
    setup do
      create_test_data!
      at_exit do
        clean_up!
      end
    end

    def create_test_data!
      BloatPNG.bloat(File.join('data', 'smiley-face.png'), File.join('data', 'smiley-fat-face.png'), 1024*1024)
    end

    def clean_up!
      if File.exists? File.join('data', 'smiley-fat-face.png')
        File.delete(File.join('data', 'smiley-fat-face.png'))
      end
    end

    should "create an output file" do
      assert File.exists?(File.join('data', 'smiley-fat-face.png'))
    end

    should "make an output file of the correct size" do
      assert_equal File.size?(File.join('data', 'smiley-fat-face.png')), 1059390
    end

  end

end
