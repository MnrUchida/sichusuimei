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
      subject.hentsusei(jikkan).name.should == "比肩"
    end

    it "劫財" do
      jikkan = Jikkan.find_by_code(1)
      subject.hentsusei(jikkan).name.should == "劫財"
    end

    it "食神" do
      jikkan = Jikkan.find_by_code(2)
      subject.hentsusei(jikkan).name.should == "食神"
    end

    it "傷官" do
      jikkan = Jikkan.find_by_code(3)
      subject.hentsusei(jikkan).name.should == "傷官"
    end

    it "偏財" do
      jikkan = Jikkan.find_by_code(4)
      subject.hentsusei(jikkan).name.should == "偏財"
    end

    it "正財" do
      jikkan = Jikkan.find_by_code(5)
      subject.hentsusei(jikkan).name.should == "正財"
    end

    it "偏官" do
      jikkan = Jikkan.find_by_code(6)
      subject.hentsusei(jikkan).name.should == "偏官"
    end

    it "正官" do
      jikkan = Jikkan.find_by_code(7)
      subject.hentsusei(jikkan).name.should == "正官"
    end

    it "偏印" do
      jikkan = Jikkan.find_by_code(8)
      subject.hentsusei(jikkan).name.should == "偏印"
    end

    it "印綬" do
      jikkan = Jikkan.find_by_code(9)
      subject.hentsusei(jikkan).name.should == "印綬"
    end

  end

  describe "乙" do

    subject{Jikkan.find_by_code(1)}
    it "比肩" do
      jikkan = Jikkan.find_by_code(1)
      subject.hentsusei(jikkan).name.should == "比肩"
    end

    it "劫財" do
      jikkan = Jikkan.find_by_code(0)
      subject.hentsusei(jikkan).name.should == "劫財"
    end

    it "食神" do
      jikkan = Jikkan.find_by_code(3)
      subject.hentsusei(jikkan).name.should == "食神"
    end

    it "傷官" do
      jikkan = Jikkan.find_by_code(2)
      subject.hentsusei(jikkan).name.should == "傷官"
    end

    it "偏財" do
      jikkan = Jikkan.find_by_code(5)
      subject.hentsusei(jikkan).name.should == "偏財"
    end

    it "正財" do
      jikkan = Jikkan.find_by_code(4)
      subject.hentsusei(jikkan).name.should == "正財"
    end

    it "偏官" do
      jikkan = Jikkan.find_by_code(7)
      subject.hentsusei(jikkan).name.should == "偏官"
    end

    it "正官" do
      jikkan = Jikkan.find_by_code(6)
      subject.hentsusei(jikkan).name.should == "正官"
    end

    it "偏印" do
      jikkan = Jikkan.find_by_code(9)
      subject.hentsusei(jikkan).name.should == "偏印"
    end

    it "印綬" do
      jikkan = Jikkan.find_by_code(8)
      subject.hentsusei(jikkan).name.should == "印綬"
    end

  end

  describe "丙" do
    subject{Jikkan.find_by_code(2)}
    it "食神" do
      jikkan = Jikkan.find_by_code(4)
      subject.hentsusei(jikkan).name.should == "食神"
    end
  end

  describe "丁" do
    subject{Jikkan.find_by_code(3)}
    it "印綬" do
      jikkan = Jikkan.find_by_code(0)
      subject.hentsusei(jikkan).name.should == "印綬"
    end
  end

  describe "戊" do
    subject{Jikkan.find_by_code(4)}
    it "正財" do
      jikkan = Jikkan.find_by_code(9)
      subject.hentsusei(jikkan).name.should == "正財"
    end
  end

  describe "己" do
    subject{Jikkan.find_by_code(5)}
    it "偏官" do
      jikkan = Jikkan.find_by_code(1)
      subject.hentsusei(jikkan).name.should == "偏官"
    end
  end

  describe "庚" do
    subject{Jikkan.find_by_code(6)}
    it "傷官" do
      jikkan = Jikkan.find_by_code(9)
      subject.hentsusei(jikkan).name.should == "傷官"
    end
  end

  describe "辛" do
    subject{Jikkan.find_by_code(7)}
    it "偏財" do
      jikkan = Jikkan.find_by_code(1)
      subject.hentsusei(jikkan).name.should == "偏財"
    end
  end

  describe "壬" do
    subject{Jikkan.find_by_code(8)}
    it "正官" do
      jikkan = Jikkan.find_by_code(5)
      subject.hentsusei(jikkan).name.should == "正官"
    end
  end

  describe "癸" do
    subject{Jikkan.find_by_code(9)}
    it "偏印" do
      jikkan = Jikkan.find_by_code(7)
      subject.hentsusei(jikkan).name.should == "偏印"
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
    subject.houn(shi).name.should == "帝旺"
  end

  it "建禄" do
    shi = Junishi.find_by_code(2)
    subject.houn(shi).name.should == "建禄"
  end
 end

 describe "乙" do

  subject{Jikkan.find_by_code(1)}
  it "帝旺" do
    shi = Junishi.find_by_code(2)
    subject.houn(shi).name.should == "帝旺"
  end

  it "建禄" do
    shi = Junishi.find_by_code(3)
    subject.houn(shi).name.should == "建禄"
  end
 end

 describe "丙" do

  subject{Jikkan.find_by_code(2)}
  it "冠帯" do
    shi = Junishi.find_by_code(4)
    subject.houn(shi).name.should == "冠帯"
  end

  it "衰" do
    shi = Junishi.find_by_code(7)
    subject.houn(shi).name.should == "衰"
  end
 end


 describe "丁" do

  subject{Jikkan.find_by_code(3)}
  it "沐浴" do
    shi = Junishi.find_by_code(8)
    subject.houn(shi).name.should == "沐浴"
  end

  it "病" do
    shi = Junishi.find_by_code(3)
    subject.houn(shi).name.should == "病"
  end
 end

end

describe Jikkan, "干合" do
  before do
    read_jikkan()

    read_gogyo()

    read_hentsusei()
  end

  describe "甲" do
    subject{Jikkan.find_by_code(0)}
    it "己" do
      jikkan = Jikkan.find_by_code(5)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "己"
    end
  end

  describe "乙" do
    subject{Jikkan.find_by_code(1)}
    it "庚" do
      jikkan = Jikkan.find_by_code(6)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "庚"
    end
  end

  describe "丙" do
    subject{Jikkan.find_by_code(2)}
    it "辛" do
      jikkan = Jikkan.find_by_code(7)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "辛"
    end
  end

  describe "丁" do
    subject{Jikkan.find_by_code(3)}
    it "壬" do
      jikkan = Jikkan.find_by_code(8)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "壬"
    end
  end

  describe "戊" do
    subject{Jikkan.find_by_code(4)}
    it "癸" do
      jikkan = Jikkan.find_by_code(9)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "癸"
    end
  end

  describe "己" do
    subject{Jikkan.find_by_code(5)}
    it "甲" do
      jikkan = Jikkan.find_by_code(0)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "甲"
    end
  end

  describe "庚" do
    subject{Jikkan.find_by_code(6)}
    it "乙" do
      jikkan = Jikkan.find_by_code(1)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "乙"
    end
  end

  describe "辛" do
    subject{Jikkan.find_by_code(7)}
    it "丙" do
      jikkan = Jikkan.find_by_code(2)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "丙"
    end
  end

  describe "壬" do
    subject{Jikkan.find_by_code(8)}
    it "丁" do
      jikkan = Jikkan.find_by_code(3)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "丁"
    end
  end

  describe "癸" do
    subject{Jikkan.find_by_code(9)}
    it "戊" do
      jikkan = Jikkan.find_by_code(4)
      subject.gou?(jikkan).should == true
      subject.gou.name.should == "戊"
    end
  end
end
