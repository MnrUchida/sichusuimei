# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Junishi, "支合" do
  before do
    read_junishi()
    read_junishi_relation()
    read_relation()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "なし" do
      subject.gou.nil?.should == true
      junishi = Junishi.find_by_code(1)
      subject.gou?(junishi).should == false
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "なし" do
      subject.gou.nil?.should == true
      junishi = Junishi.find_by_code(0)
      subject.gou?(junishi).should == false
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "亥" do
      subject.gou.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.gou?(junishi).should == true
    end
    it "酉" do
      subject.gou.name.should == "亥"
      junishi = Junishi.find_by_code(9)
      subject.gou?(junishi).should == false
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "戌" do
      subject.gou.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.gou?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "酉" do
      subject.gou.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.gou?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "申" do
      subject.gou.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.gou?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "なし" do
      subject.gou.nil?.should == true
      junishi = Junishi.find_by_code(7)
      subject.gou?(junishi).should == false
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "なし" do
      subject.gou.nil?.should == true
      junishi = Junishi.find_by_code(6)
      subject.gou?(junishi).should == false
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "巳" do
      subject.gou.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.gou?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "辰" do
      subject.gou.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.gou?(junishi).should == true
    end
    it "寅" do
      subject.gou.name.should == "辰"
      junishi = Junishi.find_by_code(2)
      subject.gou?(junishi).should == false
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "卯" do
      subject.gou.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.gou?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "寅" do
      subject.gou.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.gou?(junishi).should == true
    end
  end
end

describe Junishi, "刑" do
  before do
    read_junishi()
    read_junishi_relation()
    read_relation()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "卯" do
      subject.kei.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.kei?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "戌" do
      junishi = Junishi.find_by_code(10)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "戌"
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "巳" do
      junishi = Junishi.find_by_code(5)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "巳"
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "子" do
      junishi = Junishi.find_by_code(0)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "子"
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "辰" do
      junishi = Junishi.find_by_code(4)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "辰"
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "申" do
      junishi = Junishi.find_by_code(8)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "申"
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "午" do
      junishi = Junishi.find_by_code(6)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "午"
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "丑" do
      junishi = Junishi.find_by_code(1)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "丑"
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "寅" do
      junishi = Junishi.find_by_code(2)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "寅"
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "酉" do
      junishi = Junishi.find_by_code(9)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "酉"
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "未" do
      junishi = Junishi.find_by_code(7)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "未"
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "亥" do
      junishi = Junishi.find_by_code(11)
      subject.kei?(junishi).should == true
      subject.kei.name.should == "亥"
    end
  end
end

describe Junishi, "冲" do
  before do
    read_junishi()
    read_junishi_relation()
    read_relation()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "午" do
      subject.chu.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.chu?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "未" do
      subject.chu.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.chu?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "申" do
      subject.chu.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.chu?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "酉" do
      subject.chu.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.chu?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "戌" do
      subject.chu.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.chu?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "亥" do
      subject.chu.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.chu?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "子" do
      junishi = Junishi.find_by_code(0)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "子"
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "丑" do
      junishi = Junishi.find_by_code(1)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "丑"
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "寅" do
      junishi = Junishi.find_by_code(2)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "寅"
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "卯" do
      junishi = Junishi.find_by_code(3)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "卯"
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "辰" do
      junishi = Junishi.find_by_code(4)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "辰"
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "巳" do
      junishi = Junishi.find_by_code(5)
      subject.chu?(junishi).should == true
      subject.chu.name.should == "巳"
    end
  end
end

describe Junishi, "破" do
  before do
    read_junishi()
    read_junishi_relation()
    read_relation()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "酉" do
      subject.ha.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.ha?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "辰" do
      subject.ha.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.ha?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "亥" do
      subject.ha.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.ha?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "午" do
      subject.ha.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.ha?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丑" do
      subject.ha.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.ha?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "申" do
      subject.ha.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.ha?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "卯" do

      junishi = Junishi.find_by_code(3)
      subject.ha?(junishi).should == true
      subject.ha.name.should == "卯"
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "戌" do
      junishi = Junishi.find_by_code(10)
      subject.ha?(junishi).should == true
      subject.ha.name.should == "戌"
    end
  end

  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "巳" do
      junishi = Junishi.find_by_code(5)
      subject.ha?(junishi).should == true
      subject.ha.name.should == "巳"
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "子" do
      junishi = Junishi.find_by_code(0)
      subject.ha?(junishi).should == true
      subject.ha.name.should == "子"
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "未" do
      subject.ha.name.should == "未"

      junishi = Junishi.find_by_code(7)
      subject.ha?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "寅" do
      junishi = Junishi.find_by_code(2)
      subject.ha?(junishi).should == true
      subject.ha.name.should == "寅"
    end
  end
end

describe Junishi, "害" do
  before do
    read_junishi()
    read_junishi_relation()
    read_relation()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "未" do
      subject.gai.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.gai?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "午" do
      subject.gai.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.gai?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "巳" do
      subject.gai.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.gai?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "辰" do
      subject.gai.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.gai?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "卯" do
      subject.gai.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.gai?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "寅" do
      subject.gai.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.gai?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "丑" do
      subject.gai.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.gai?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "子" do
      subject.gai.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.gai?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "亥" do
      subject.gai.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.gai?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "戌" do
      subject.gai.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.gai?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "酉" do
      subject.gai.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.gai?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "申" do
      subject.gai.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.gai?(junishi).should == true
    end
  end
end
