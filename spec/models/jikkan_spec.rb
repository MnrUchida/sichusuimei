# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Jikkan, "変通星取得" do

  before do
    read_jikkan()

    read_gogyo()

    read_hentsusei()
  end

  describe "甲" do

    subject{Jikkan.find_by_code(0)}
    it "比肩" do
      jikkan = Jikkan.find_by_code(0)
      subject.getHentsusei(jikkan).name.should == "比肩"
    end

    it "劫財" do
      jikkan = Jikkan.find_by_code(1)
      subject.getHentsusei(jikkan).name.should == "劫財"
    end

    it "食神" do
      jikkan = Jikkan.find_by_code(2)
      subject.getHentsusei(jikkan).name.should == "食神"
    end

    it "傷官" do
      jikkan = Jikkan.find_by_code(3)
      subject.getHentsusei(jikkan).name.should == "傷官"
    end

    it "偏財" do
      jikkan = Jikkan.find_by_code(4)
      subject.getHentsusei(jikkan).name.should == "偏財"
    end

    it "正財" do
      jikkan = Jikkan.find_by_code(5)
      subject.getHentsusei(jikkan).name.should == "正財"
    end

    it "偏官" do
      jikkan = Jikkan.find_by_code(6)
      subject.getHentsusei(jikkan).name.should == "偏官"
    end

    it "正官" do
      jikkan = Jikkan.find_by_code(7)
      subject.getHentsusei(jikkan).name.should == "正官"
    end

    it "偏印" do
      jikkan = Jikkan.find_by_code(8)
      subject.getHentsusei(jikkan).name.should == "偏印"
    end

    it "印綬" do
      jikkan = Jikkan.find_by_code(9)
      subject.getHentsusei(jikkan).name.should == "印綬"
    end

  end

  describe "乙" do

    subject{Jikkan.find_by_code(1)}
    it "比肩" do
      jikkan = Jikkan.find_by_code(1)
      subject.getHentsusei(jikkan).name.should == "比肩"
    end

    it "劫財" do
      jikkan = Jikkan.find_by_code(0)
      subject.getHentsusei(jikkan).name.should == "劫財"
    end

    it "食神" do
      jikkan = Jikkan.find_by_code(3)
      subject.getHentsusei(jikkan).name.should == "食神"
    end

    it "傷官" do
      jikkan = Jikkan.find_by_code(2)
      subject.getHentsusei(jikkan).name.should == "傷官"
    end

    it "偏財" do
      jikkan = Jikkan.find_by_code(5)
      subject.getHentsusei(jikkan).name.should == "偏財"
    end

    it "正財" do
      jikkan = Jikkan.find_by_code(4)
      subject.getHentsusei(jikkan).name.should == "正財"
    end

    it "偏官" do
      jikkan = Jikkan.find_by_code(7)
      subject.getHentsusei(jikkan).name.should == "偏官"
    end

    it "正官" do
      jikkan = Jikkan.find_by_code(6)
      subject.getHentsusei(jikkan).name.should == "正官"
    end

    it "偏印" do
      jikkan = Jikkan.find_by_code(9)
      subject.getHentsusei(jikkan).name.should == "偏印"
    end

    it "印綬" do
      jikkan = Jikkan.find_by_code(8)
      subject.getHentsusei(jikkan).name.should == "印綬"
    end

  end

  describe "丙" do
    subject{Jikkan.find_by_code(2)}
    it "食神" do
      jikkan = Jikkan.find_by_code(4)
      subject.getHentsusei(jikkan).name.should == "食神"
    end
  end

  describe "丁" do
    subject{Jikkan.find_by_code(3)}
    it "印綬" do
      jikkan = Jikkan.find_by_code(0)
      subject.getHentsusei(jikkan).name.should == "印綬"
    end
  end

  describe "戊" do
    subject{Jikkan.find_by_code(4)}
    it "正財" do
      jikkan = Jikkan.find_by_code(9)
      subject.getHentsusei(jikkan).name.should == "正財"
    end
  end

  describe "己" do
    subject{Jikkan.find_by_code(5)}
    it "偏官" do
      jikkan = Jikkan.find_by_code(1)
      subject.getHentsusei(jikkan).name.should == "偏官"
    end
  end

  describe "庚" do
    subject{Jikkan.find_by_code(6)}
    it "傷官" do
      jikkan = Jikkan.find_by_code(9)
      subject.getHentsusei(jikkan).name.should == "傷官"
    end
  end

  describe "辛" do
    subject{Jikkan.find_by_code(7)}
    it "偏財" do
      jikkan = Jikkan.find_by_code(1)
      subject.getHentsusei(jikkan).name.should == "偏財"
    end
  end

  describe "壬" do
    subject{Jikkan.find_by_code(8)}
    it "正官" do
      jikkan = Jikkan.find_by_code(5)
      subject.getHentsusei(jikkan).name.should == "正官"
    end
  end

  describe "癸" do
    subject{Jikkan.find_by_code(9)}
    it "偏印" do
      jikkan = Jikkan.find_by_code(7)
      subject.getHentsusei(jikkan).name.should == "偏印"
    end
  end

end

describe Jikkan, "補運取得" do

 before do
       read_jikkan()

       read_junishi()
              
       read_gogyo()

       read_houn()
 end

 describe "甲" do

  subject{Jikkan.find_by_code(0)}
  it "帝旺" do
    shi = Junishi.find_by_code(3)
    subject.getHoun(shi).name.should == "帝旺"
  end

  it "建禄" do
    shi = Junishi.find_by_code(2)
    subject.getHoun(shi).name.should == "建禄"
  end
 end

 describe "乙" do

  subject{Jikkan.find_by_code(1)}
  it "帝旺" do
    shi = Junishi.find_by_code(2)
    subject.getHoun(shi).name.should == "帝旺"
  end

  it "建禄" do
    shi = Junishi.find_by_code(3)
    subject.getHoun(shi).name.should == "建禄"
  end
 end

 describe "丙" do

  subject{Jikkan.find_by_code(2)}
  it "冠帯" do
    shi = Junishi.find_by_code(4)
    subject.getHoun(shi).name.should == "冠帯"
  end

  it "衰" do
    shi = Junishi.find_by_code(7)
    subject.getHoun(shi).name.should == "衰"
  end
 end


 describe "丁" do

  subject{Jikkan.find_by_code(3)}
  it "沐浴" do
    shi = Junishi.find_by_code(8)
    subject.getHoun(shi).name.should == "沐浴"
  end

  it "病" do
    shi = Junishi.find_by_code(3)
    subject.getHoun(shi).name.should == "病"
  end
 end

end
