require "layout_convert"

describe "A magic mixin module" do
  let(:latin_example) { 'hello world' }
  let(:cyrillic_example) { 'здравствуй, мир' }
  let(:mixed_example) { 'здравствуй, мир world' }

  describe "has the 'guess_layout'" do
    it "should guess the latin layout of the string with latin chars" do
      expect(latin_example.guess_layout).to be_equal :lat
    end
    it "should guess the cyrillic layout of the string with cyrillic chars" do
      expect(cyrillic_example.guess_layout).to be_equal :cyr
    end
    it "should guess the mixed layout of the string with cyrillic and latin chars" do
      expect(mixed_example.guess_layout).to be_equal :mixed
    end
  end

  describe "has the 'cyrillic?' method" do
    it "should return true if the given string is cyrillic" do
      expect(cyrillic_example.cyrillic?).to be true
    end

    it "should return false if the given string is latin" do
      expect(latin_example.cyrillic?).to be false
    end

    it "should return false if the given string is both latin and cyrillic" do
      expect(mixed_example.cyrillic?).to be false
    end
  end

  describe "has the 'latin?' method" do
    it "should return false if the given string is cyrillic" do
      expect(cyrillic_example.latin?).to be false 
    end

    it "should return true if the given string is latin" do
      expect(latin_example.latin?).to be true
    end

    it "should return false if the given string is both latin and cyrillic" do
      expect(mixed_example.latin?).to be false
    end
  end

  describe "has the 'mixed?' method" do
    it "should return true if the given string is cyrillic" do
      expect(cyrillic_example.mixed?).to be false 
    end

    it "should return false if the given string is latin" do
      expect(latin_example.mixed?).to be false
    end

    it "should return false if the given string is both latin and mixed" do
      expect(mixed_example.mixed?).to be true 
    end
  end
end 
