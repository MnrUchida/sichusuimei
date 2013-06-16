# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Junishi, "蔵干取得" do

  shared_examples_for :zoukan_validation do |days, valid_value|
    days.each{|day| it{ subject.zoukan(0).code.to_s.should == valid_value }}
  end

 before do
   read_all_seeds()
 end

 describe "子" do

  subject{Junishi.find_by_code(0)}
  describe "余気 壬" do
    it_behaves_like :zoukan_validation, [0, 10], "8"
  end
  it "正気 癸" do
      subject.zoukan(11).code.to_s.should == "9"
      subject.zoukan(30).code.to_s.should == "9"
  end
 end

 describe "丑" do

  subject{Junishi.find_by_code(1)}
  it "余気 癸" do
      subject.zoukan(0).code.to_s.should == "9"
      subject.zoukan(9).code.to_s.should == "9"
  end
  it "中気 辛" do
      subject.zoukan(10).code.to_s.should == "7"
      subject.zoukan(12).code.to_s.should == "7"
  end
  it "正気 己" do
      subject.zoukan(13).code.to_s.should == "5"
      subject.zoukan(30).code.to_s.should == "5"
  end
 end

 describe "寅" do

  subject{Junishi.find_by_code(2)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(7).code.to_s.should == "4"
  end
  it "中気 丙" do
      subject.zoukan(8).code.to_s.should == "2"
      subject.zoukan(14).code.to_s.should == "2"
  end
  it "正気 甲" do
      subject.zoukan(15).code.to_s.should == "0"
      subject.zoukan(30).code.to_s.should == "0"
  end
 end

 describe "卯" do

  subject{Junishi.find_by_code(3)}
  it "余気 甲" do
      subject.zoukan(0).code.to_s.should == "0"
      subject.zoukan(10).code.to_s.should == "0"
  end
  it "正気 乙" do
      subject.zoukan(11).code.to_s.should == "1"
      subject.zoukan(30).code.to_s.should == "1"
  end
 end

 describe "辰" do

  subject{Junishi.find_by_code(4)}
  it "余気 乙" do
      subject.zoukan(0).code.to_s.should == "1"
      subject.zoukan(9).code.to_s.should == "1"
  end
  it "中気 癸" do
      subject.zoukan(10).code.to_s.should == "9"
      subject.zoukan(12).code.to_s.should == "9"
  end
  it "正気 戊" do
      subject.zoukan(13).code.to_s.should == "4"
      subject.zoukan(30).code.to_s.should == "4"
  end
 end

 describe "巳" do

  subject{Junishi.find_by_code(5)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(7).code.to_s.should == "4"
  end
  it "中気 庚" do
      subject.zoukan(8).code.to_s.should == "6"
      subject.zoukan(14).code.to_s.should == "6"
  end
  it "正気 丙" do
      subject.zoukan(15).code.to_s.should == "2"
      subject.zoukan(30).code.to_s.should == "2"
  end
 end

 describe "午" do

  subject{Junishi.find_by_code(6)}
  it "余気 丙" do
      subject.zoukan(0).code.to_s.should == "2"
      subject.zoukan(10).code.to_s.should == "2"
  end
  it "中気 己" do
      subject.zoukan(11).code.to_s.should == "5"
      subject.zoukan(17).code.to_s.should == "5"
  end
  it "正気 丁" do
      subject.zoukan(18).code.to_s.should == "3"
      subject.zoukan(30).code.to_s.should == "3"
  end
 end

 describe "未" do

  subject{Junishi.find_by_code(7)}
  it "余気 丁" do
      subject.zoukan(0).code.to_s.should == "3"
      subject.zoukan(9).code.to_s.should == "3"
  end
  it "中気 乙" do
      subject.zoukan(10).code.to_s.should == "1"
      subject.zoukan(12).code.to_s.should == "1"
  end
  it "正気 己" do
      subject.zoukan(13).code.to_s.should == "5"
      subject.zoukan(30).code.to_s.should == "5"
  end
 end


 describe "申" do

  subject{Junishi.find_by_code(8)}
  it "余気 己" do
      subject.zoukan(0).code.to_s.should == "5"
      subject.zoukan(7).code.to_s.should == "5"
  end
  it "中気 壬" do
      subject.zoukan(8).code.to_s.should == "8"
      subject.zoukan(14).code.to_s.should == "8"
  end
  it "正気 庚" do
      subject.zoukan(15).code.to_s.should == "6"
      subject.zoukan(30).code.to_s.should == "6"
  end
 end


 describe "酉" do

  subject{Junishi.find_by_code(9)}
  it "余気 庚" do
      subject.zoukan(0).code.to_s.should == "6"
      subject.zoukan(10).code.to_s.should == "6"
  end
  it "正気 辛" do
      subject.zoukan(11).code.to_s.should == "7"
      subject.zoukan(30).code.to_s.should == "7"
  end
 end

 describe "戌" do

  subject{Junishi.find_by_code(10)}
  it "余気 辛" do
      subject.zoukan(0).code.to_s.should == "7"
      subject.zoukan(9).code.to_s.should == "7"
  end
  it "中気 丁" do
      subject.zoukan(10).code.to_s.should == "3"
      subject.zoukan(12).code.to_s.should == "3"
  end
  it "正気 戊" do
      subject.zoukan(13).code.to_s.should == "4"
      subject.zoukan(30).code.to_s.should == "4"
  end
 end

 describe "亥" do

  subject{Junishi.find_by_code(11)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(7).code.to_s.should == "4"
  end
  it "中気 甲" do
      subject.zoukan(8).code.to_s.should == "0"
      subject.zoukan(14).code.to_s.should == "0"
  end
  it "正気 壬" do
      subject.zoukan(15).code.to_s.should == "8"
      subject.zoukan(30).code.to_s.should == "8"
  end
 end
end

describe Junishi, "天徳取得" do

 before do
   read_all_seeds()
 end
 describe "子" do

  subject{Junishi.find_by_code(0).tentoku}
  it "天徳" do
      subject[0].name.should == "巳"
      subject[1].name.should == "申"
  end
 end

 describe "丑" do

  subject{Junishi.find_by_code(1).tentoku}
  it "天徳" do
      subject[0].name.should == "庚"
      subject[1].name.should == "乙"
  end
 end

 describe "寅" do

  subject{Junishi.find_by_code(2).tentoku}
  it "天徳" do
      subject[0].name.should == "丁"
      subject[1].name.should == "壬"
  end
 end

 describe "卯" do

  subject{Junishi.find_by_code(3).tentoku}
  it "天徳" do
      subject[0].name.should == "申"
      subject[1].name.should == "巳"
  end
 end

 describe "辰" do

  subject{Junishi.find_by_code(4).tentoku}
  it "天徳" do
      subject[0].name.should == "壬"
      subject[1].name.should == "丁"
  end
 end

 describe "巳" do

  subject{Junishi.find_by_code(5).tentoku}
  it "天徳" do
      subject[0].name.should == "辛"
      subject[1].name.should == "丙"
  end
 end

 describe "午" do

  subject{Junishi.find_by_code(6).tentoku}
  it "天徳" do
      subject[0].name.should == "亥"
      subject[1].name.should == "寅"
  end
 end

 describe "未" do

  subject{Junishi.find_by_code(7).tentoku}
  it "天徳" do
      subject[0].name.should == "甲"
      subject[1].name.should == "己"
  end
 end

 describe "申" do

  subject{Junishi.find_by_code(8).tentoku}
  it "天徳" do
      subject[0].name.should == "癸"
      subject[1].name.should == "戊"
  end
 end


 describe "酉" do

  subject{Junishi.find_by_code(9).tentoku}
  it "天徳" do
      subject[0].name.should == "寅"
      subject[1].name.should == "亥"
  end
 end

 describe "戌" do

  subject{Junishi.find_by_code(10).tentoku}
  it "天徳" do
      subject[0].name.should == "丙"
      subject[1].name.should == "辛"
  end
 end

 describe "亥" do

  subject{Junishi.find_by_code(11).tentoku}
  it "天徳" do
      subject[0].name.should == "乙"
      subject[1].name.should == "庚"
  end
 end
end

describe Junishi, "五行取得" do

  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "余気 壬" do
      subject.gogyo(0)[0].code.should == 4
      subject.gogyo(9)[0].code.should == 4
    end
    it "正気 癸" do
      subject.gogyo(10)[0].code.should == 4
      subject.gogyo(30)[0].code.should == 4
    end
  end
end

describe Junishi, "支合" do
  before do
    read_all_seeds()
  end

    describe "子" do

      subject{Junishi.find_by_code(0)}
      it "なし" do
        junishi = Junishi.find_by_code(1)
        subject.gou?(junishi).should == false
        subject.gou.nil?.should == true
      end
    end

    describe "丑" do

      subject{Junishi.find_by_code(1)}
      it "なし" do
        junishi = Junishi.find_by_code(0)
        subject.gou?(junishi).should == false
        subject.gou.nil?.should == true
      end
    end

    describe "寅" do

      subject{Junishi.find_by_code(2)}
      it "亥" do
        junishi = Junishi.find_by_code(11)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "亥"
      end
      it "酉" do
        junishi = Junishi.find_by_code(9)
        subject.gou?(junishi).should == false
        subject.gou.name.should == "亥"
      end
    end

    describe "卯" do

      subject{Junishi.find_by_code(3)}
      it "戌" do
        junishi = Junishi.find_by_code(10)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "戌"
      end
    end

    describe "辰" do

      subject{Junishi.find_by_code(4)}
      it "酉" do
        junishi = Junishi.find_by_code(9)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "酉"
      end
    end

    describe "巳" do

      subject{Junishi.find_by_code(5)}
      it "申" do
        junishi = Junishi.find_by_code(8)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "申"
      end
    end

    describe "午" do

      subject{Junishi.find_by_code(6)}
      it "なし" do
        junishi = Junishi.find_by_code(7)
        subject.gou?(junishi).should == false
        subject.gou.nil?.should == true
      end
    end

    describe "未" do

      subject{Junishi.find_by_code(7)}
      it "なし" do
        junishi = Junishi.find_by_code(6)
        subject.gou?(junishi).should == false
        subject.gou.nil?.should == true
      end
    end


    describe "申" do

      subject{Junishi.find_by_code(8)}
      it "巳" do
        junishi = Junishi.find_by_code(5)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "巳"
      end
    end

    describe "酉" do

      subject{Junishi.find_by_code(9)}
      it "辰" do
        junishi = Junishi.find_by_code(4)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "辰"
      end
      it "寅" do
        junishi = Junishi.find_by_code(2)
        subject.gou?(junishi).should == false
        subject.gou.name.should == "辰"
      end
    end

    describe "戌" do

      subject{Junishi.find_by_code(10)}
      it "卯" do
        junishi = Junishi.find_by_code(3)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "卯"
      end
    end

    describe "亥" do

      subject{Junishi.find_by_code(11)}
      it "寅" do
        junishi = Junishi.find_by_code(2)
        subject.gou?(junishi).should == true
        subject.gou.name.should == "寅"
      end
  end
end

describe Junishi, "支合" do
  before do
    read_all_seeds()
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
    read_all_seeds()
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
    read_all_seeds()
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
    read_all_seeds()
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
    read_all_seeds()
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

describe Junishi, "華蓋" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "辰" do
      subject.kagai.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.kagai?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "丑" do
      subject.kagai.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.kagai?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "戌" do
      subject.kagai.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.kagai?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "未" do
      subject.kagai.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.kagai?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "辰" do
      subject.kagai.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.kagai?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "丑" do
      subject.kagai.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.kagai?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "戌" do
      subject.kagai.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.kagai?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "未" do
      subject.kagai.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.kagai?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "辰" do
      subject.kagai.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.kagai?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "丑" do
      subject.kagai.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.kagai?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "戌" do
      subject.kagai.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.kagai?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "未" do
      subject.kagai.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.kagai?(junishi).should == true
    end
  end
end

describe Junishi, "天耗" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "申" do
      puts subject.tenmou_angle
      subject.tenmou.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "戌" do
      subject.tenmou.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "子" do
      subject.tenmou.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "寅" do
      subject.tenmou.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "辰" do
      subject.tenmou.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "午" do
      subject.tenmou.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "申" do
      subject.tenmou.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "戌" do
      subject.tenmou.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.tenmou?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "子" do
      subject.tenmou.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "寅" do
      subject.tenmou.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "辰" do
      subject.tenmou.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.tenmou?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "午" do
      subject.tenmou.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.tenmou?(junishi).should == true
    end
  end
end

describe Junishi, "地耗" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "巳" do
      subject.chimou.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.chimou?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "未" do
      subject.chimou.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.chimou?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "酉" do
      subject.chimou.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.chimou?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "亥" do
      subject.chimou.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.chimou?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丑" do
      subject.chimou.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.chimou?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "卯" do
      subject.chimou.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.chimou?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "巳" do
      subject.chimou.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.chimou?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "未" do
      subject.chimou.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.chimou?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "酉" do
      subject.chimou.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.chimou?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "亥" do
      subject.chimou.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.chimou?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "丑" do
      subject.chimou.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.chimou?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "卯" do
      subject.chimou.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.chimou?(junishi).should == true
    end
  end
end

describe Junishi, "白衣" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "酉" do
      subject.byakui.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.byakui?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "辰" do
      subject.byakui.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.byakui?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "巳" do
      subject.byakui.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.byakui?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "子" do
      subject.byakui.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.byakui?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丑" do
      subject.byakui.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.byakui?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "申" do
      subject.byakui.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.byakui?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "卯" do
      subject.byakui.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.byakui?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "戌" do
      subject.byakui.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.byakui?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "亥" do
      subject.byakui.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.byakui?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "午" do
      subject.byakui.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.byakui?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "未" do
      subject.byakui.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.byakui?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "寅" do
      subject.byakui.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.byakui?(junishi).should == true
    end
  end
end

describe Junishi, "断橋" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "子" do
      subject.dankyo.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "亥" do
      subject.dankyo.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "寅" do
      subject.dankyo.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "卯" do
      subject.dankyo.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "申" do
      subject.dankyo.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "丑" do
      subject.dankyo.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "戌" do
      subject.dankyo.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "酉" do
      subject.dankyo.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.dankyo?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "辰" do
      subject.dankyo.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "巳" do
      subject.dankyo.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "午" do
      subject.dankyo.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.dankyo?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "未" do
      subject.dankyo.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.dankyo?(junishi).should == true
    end
  end
end

describe Junishi, "血支" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "申" do
      subject.kessi.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.kessi?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "酉" do
      subject.kessi.name.should == "酉"
      junishi = Junishi.find_by_code(9)
      subject.kessi?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "戌" do
      subject.kessi.name.should == "戌"
      junishi = Junishi.find_by_code(10)
      subject.kessi?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "亥" do
      subject.kessi.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.kessi?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "子" do
      subject.kessi.name.should == "子"
      junishi = Junishi.find_by_code(0)
      subject.kessi?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "丑" do
      subject.kessi.name.should == "丑"
      junishi = Junishi.find_by_code(1)
      subject.kessi?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "寅" do
      subject.kessi.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.kessi?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "卯" do
      subject.kessi.name.should == "卯"
      junishi = Junishi.find_by_code(3)
      subject.kessi?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "辰" do
      subject.kessi.name.should == "辰"
      junishi = Junishi.find_by_code(4)
      subject.kessi?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "巳" do
      subject.kessi.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.kessi?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "午" do
      subject.kessi.name.should == "午"
      junishi = Junishi.find_by_code(6)
      subject.kessi?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "未" do
      subject.kessi.name.should == "未"
      junishi = Junishi.find_by_code(7)
      subject.kessi?(junishi).should == true
    end
  end
end

describe Junishi, "天徳貴人" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "巳" do
      subject.tentoku_kijin.name.should == "巳"
      junishi = MeishikiPlr.new(:chishi_id => 6)
      subject.tentoku_kijin?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "庚" do
      subject.tentoku_kijin.name.should == "庚"
      jikkan = MeishikiPlr.new(:tenkan_id => 7)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "丁" do
      subject.tentoku_kijin.name.should == "丁"
      jikkan = MeishikiPlr.new(:tenkan_id => 4)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "申" do
      subject.tentoku_kijin.name.should == "申"
      junishi = MeishikiPlr.new(:chishi_id => 9)
      subject.tentoku_kijin?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "壬" do
      subject.tentoku_kijin.name.should == "壬"
      jikkan = MeishikiPlr.new(:tenkan_id => 9)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "辛" do
      subject.tentoku_kijin.name.should == "辛"
      jikkan = MeishikiPlr.new(:tenkan_id => 8)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "亥" do
      subject.tentoku_kijin.name.should == "亥"
      junishi = MeishikiPlr.new(:chishi_id => 12)
      subject.tentoku_kijin?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "甲" do
      subject.tentoku_kijin.name.should == "甲"
      jikkan = MeishikiPlr.new(:tenkan_id => 1)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "癸" do
      subject.tentoku_kijin.name.should == "癸"
      jikkan = MeishikiPlr.new(:tenkan_id => 10)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "寅" do
      subject.tentoku_kijin.name.should == "寅"
      junishi = MeishikiPlr.new(:chishi_id => 3)
      subject.tentoku_kijin?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "丙" do
      subject.tentoku_kijin.name.should == "丙"
      jikkan = MeishikiPlr.new(:tenkan_id => 3)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "乙" do
      subject.tentoku_kijin.name.should == "乙"
      jikkan = MeishikiPlr.new(:tenkan_id => 2)
      subject.tentoku_kijin?(jikkan).should == true
    end
  end
end

describe Junishi, "天徳合" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "申" do
      subject.tentoku_gou.name.should == "申"
      junishi = MeishikiPlr.new(:chishi_id => 9)
      subject.tentoku_gou?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "乙" do
      subject.tentoku_gou.name.should == "乙"
      jikkan = MeishikiPlr.new(:tenkan_id => 2)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "壬" do
      subject.tentoku_gou.name.should == "壬"
      jikkan = MeishikiPlr.new(:tenkan_id => 9)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "巳" do
      subject.tentoku_gou.name.should == "巳"
      junishi = MeishikiPlr.new(:chishi_id => 6)
      subject.tentoku_gou?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丁" do
      subject.tentoku_gou.name.should == "丁"
      jikkan = MeishikiPlr.new(:tenkan_id => 4)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "丙" do
      subject.tentoku_gou.name.should == "丙"
      jikkan = MeishikiPlr.new(:tenkan_id => 3)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "寅" do
      subject.tentoku_gou.name.should == "寅"
      junishi = MeishikiPlr.new(:chishi_id => 3)
      subject.tentoku_gou?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "己" do
      subject.tentoku_gou.name.should == "己"
      jikkan = MeishikiPlr.new(:tenkan_id => 6)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "戊" do
      subject.tentoku_gou.name.should == "戊"
      jikkan = MeishikiPlr.new(:tenkan_id => 5)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "亥" do
      subject.tentoku_gou.name.should == "亥"
      junishi = MeishikiPlr.new(:chishi_id => 12)
      subject.tentoku_gou?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "辛" do
      subject.tentoku_gou.name.should == "辛"
      jikkan = MeishikiPlr.new(:tenkan_id => 8)
      subject.tentoku_gou?(jikkan).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "庚" do
      subject.tentoku_gou.name.should == "庚"
      jikkan = MeishikiPlr.new(:tenkan_id => 7)
      subject.tentoku_gou?(jikkan).should == true
    end
  end
end

describe Junishi, "月徳貴人" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "壬" do
      subject.gettoku_kijin.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "庚" do
      subject.gettoku_kijin.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "丙" do
      subject.gettoku_kijin.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "甲" do
      subject.gettoku_kijin.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "壬" do
      subject.gettoku_kijin.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(1)}
    it "庚" do
      subject.gettoku_kijin.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "丙" do
      subject.gettoku_kijin.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "甲" do
      subject.gettoku_kijin.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "壬" do
      subject.gettoku_kijin.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(1)}
    it "庚" do
      subject.gettoku_kijin.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "丙" do
      subject.gettoku_kijin.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "甲" do
      subject.gettoku_kijin.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gettoku_kijin?(jikkan).should == true
    end
  end
end

describe Junishi, "月徳合" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "丁" do
      subject.gettoku_gou.name.should == "丁"
      jikkan = Jikkan.find_by_code(3)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "乙" do
      subject.gettoku_gou.name.should == "乙"
      jikkan = Jikkan.find_by_code(1)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "辛" do
      subject.gettoku_gou.name.should == "辛"
      jikkan = Jikkan.find_by_code(7)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "己" do
      subject.gettoku_gou.name.should == "己"
      jikkan = Jikkan.find_by_code(5)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丁" do
      subject.gettoku_gou.name.should == "丁"
      jikkan = Jikkan.find_by_code(3)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(1)}
    it "乙" do
      subject.gettoku_gou.name.should == "乙"
      jikkan = Jikkan.find_by_code(1)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "辛" do
      subject.gettoku_gou.name.should == "辛"
      jikkan = Jikkan.find_by_code(7)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "己" do
      subject.gettoku_gou.name.should == "己"
      jikkan = Jikkan.find_by_code(5)
      subject.gettoku_gou?(jikkan).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "丁" do
      subject.gettoku_gou.name.should == "丁"
      jikkan = Jikkan.find_by_code(3)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(1)}
    it "乙" do
      subject.gettoku_gou.name.should == "乙"
      jikkan = Jikkan.find_by_code(1)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "辛" do
      subject.gettoku_gou.name.should == "辛"
      jikkan = Jikkan.find_by_code(7)
      subject.gettoku_gou?(jikkan).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "己" do
      subject.gettoku_gou.name.should == "己"
      jikkan = Jikkan.find_by_code(5)
      subject.gettoku_gou?(jikkan).should == true
    end
  end
end

describe Junishi, "月空" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "丙" do
      subject.gekku.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "甲" do
      subject.gekku.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "壬" do
      subject.gekku.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "庚" do
      subject.gekku.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "丙" do
      subject.gekku.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(1)}
    it "甲" do
      subject.gekku.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "壬" do
      subject.gekku.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "庚" do
      subject.gekku.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gekku?(jikkan).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "丙" do
      subject.gekku.name.should == "丙"
      jikkan = Jikkan.find_by_code(2)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(1)}
    it "甲" do
      subject.gekku.name.should == "甲"
      jikkan = Jikkan.find_by_code(0)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "壬" do
      subject.gekku.name.should == "壬"
      jikkan = Jikkan.find_by_code(8)
      subject.gekku?(jikkan).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "庚" do
      subject.gekku.name.should == "庚"
      jikkan = Jikkan.find_by_code(6)
      subject.gekku?(jikkan).should == true
    end
  end
end

describe Junishi, "駅馬" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "寅" do
      subject.ekiba.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "亥" do
      subject.ekiba.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "申" do
      subject.ekiba.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "巳" do
      subject.ekiba.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "寅" do
      subject.ekiba.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "亥" do
      subject.ekiba.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "申" do
      subject.ekiba.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "巳" do
      subject.ekiba.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.ekiba?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "寅" do
      subject.ekiba.name.should == "寅"
      junishi = Junishi.find_by_code(2)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "亥" do
      subject.ekiba.name.should == "亥"
      junishi = Junishi.find_by_code(11)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "申" do
      subject.ekiba.name.should == "申"
      junishi = Junishi.find_by_code(8)
      subject.ekiba?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "巳" do
      subject.ekiba.name.should == "巳"
      junishi = Junishi.find_by_code(5)
      subject.ekiba?(junishi).should == true
    end
  end
end

describe Junishi, "生成馬" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "甲寅" do
      junishi = MeishikiPlr.new(:tenkan_id => 1, :chishi_id =>3)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "辛亥" do
      junishi = MeishikiPlr.new(:tenkan_id => 8, :chishi_id => 12)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "庚申" do
      junishi = MeishikiPlr.new(:tenkan_id => 7, :chishi_id => 9)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "丁巳" do
      junishi = MeishikiPlr.new(:tenkan_id => 4, :chishi_id => 6)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "甲寅" do
      junishi = MeishikiPlr.new(:tenkan_id => 1, :chishi_id =>3)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "辛亥" do
      junishi = MeishikiPlr.new(:tenkan_id => 8, :chishi_id => 12)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "庚申" do
      junishi = MeishikiPlr.new(:tenkan_id => 7, :chishi_id => 9)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "丁巳" do
      junishi = MeishikiPlr.new(:tenkan_id => 4, :chishi_id => 6)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "甲寅" do
      junishi = MeishikiPlr.new(:tenkan_id => 1, :chishi_id =>3)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "辛亥" do
      junishi = MeishikiPlr.new(:tenkan_id => 8, :chishi_id => 12)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "庚申" do
      junishi = MeishikiPlr.new(:tenkan_id => 7, :chishi_id => 9)
      subject.seiseiba?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "丁巳" do
      junishi = MeishikiPlr.new(:tenkan_id => 4, :chishi_id => 6)
      subject.seiseiba?(junishi).should == true
    end
  end
end

describe Junishi, "喪門" do
  before do
    read_all_seeds()
  end

  describe "子" do

    subject{Junishi.find_by_code(0)}
    it "寅" do
      subject.momon.name.should == "寅"
    end

    it "寅" do
      junishi = Junishi.find_by_code(2)
      subject.momon?(junishi).should == true
    end
  end

  describe "丑" do

    subject{Junishi.find_by_code(1)}
    it "卯" do
      subject.momon.name.should == "卯"
    end

    it "卯" do
      junishi = Junishi.find_by_code(3)
      subject.momon?(junishi).should == true
    end
  end

  describe "寅" do

    subject{Junishi.find_by_code(2)}
    it "辰" do
      subject.momon.name.should == "辰"
    end

    it "辰" do
      junishi = Junishi.find_by_code(4)
      subject.momon?(junishi).should == true
    end
  end

  describe "卯" do

    subject{Junishi.find_by_code(3)}
    it "巳" do
      subject.momon.name.should == "巳"
    end

    it "巳" do
      junishi = Junishi.find_by_code(5)
      subject.momon?(junishi).should == true
    end
  end

  describe "辰" do

    subject{Junishi.find_by_code(4)}
    it "午" do
      subject.momon.name.should == "午"
    end

    it "午" do
      junishi = Junishi.find_by_code(6)
      subject.momon?(junishi).should == true
    end
  end

  describe "巳" do

    subject{Junishi.find_by_code(5)}
    it "未" do
      subject.momon.name.should == "未"
    end

    it "未" do
      junishi = Junishi.find_by_code(7)
      subject.momon?(junishi).should == true
    end
  end

  describe "午" do

    subject{Junishi.find_by_code(6)}
    it "申" do
      subject.momon.name.should == "申"
    end

    it "申" do
      junishi = Junishi.find_by_code(8)
      subject.momon?(junishi).should == true
    end
  end

  describe "未" do

    subject{Junishi.find_by_code(7)}
    it "酉" do
      subject.momon.name.should == "酉"
    end

    it "酉" do
      junishi = Junishi.find_by_code(9)
      subject.momon?(junishi).should == true
    end
  end


  describe "申" do

    subject{Junishi.find_by_code(8)}
    it "戌" do
      subject.momon.name.should == "戌"
    end

    it "戌" do
      junishi = Junishi.find_by_code(10)
      subject.momon?(junishi).should == true
    end
  end

  describe "酉" do

    subject{Junishi.find_by_code(9)}
    it "亥" do
      subject.momon.name.should == "亥"
    end

    it "亥" do
      junishi = Junishi.find_by_code(11)
      subject.momon?(junishi).should == true
    end
  end

  describe "戌" do

    subject{Junishi.find_by_code(10)}
    it "子" do
      subject.momon.name.should == "子"
    end

    it "子" do
      junishi = Junishi.find_by_code(0)
      subject.momon?(junishi).should == true
    end
  end

  describe "亥" do

    subject{Junishi.find_by_code(11)}
    it "丑" do
      subject.momon.name.should == "丑"
    end

    it "丑" do
      junishi = Junishi.find_by_code(1)
      subject.momon?(junishi).should == true
    end
  end
end
