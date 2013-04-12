# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Junishi, "蔵干取得" do

 before do
       read_junishi()
       read_jikkan()
       read_junishi_term()
 end

 describe "子" do

  subject{Junishi.find_by_code(0)}
  it "余気 壬" do
      subject.zoukan(0).code.to_s.should == "8"
      subject.zoukan(9).code.to_s.should == "8"
  end
  it "正気 癸" do
      subject.zoukan(10).code.to_s.should == "9"
      subject.zoukan(30).code.to_s.should == "9"
  end
 end

 describe "丑" do

  subject{Junishi.find_by_code(1)}
  it "余気 癸" do
      subject.zoukan(0).code.to_s.should == "9"
      subject.zoukan(8).code.to_s.should == "9"
  end
  it "中気 辛" do
      subject.zoukan(9).code.to_s.should == "7"
      subject.zoukan(11).code.to_s.should == "7"
  end
  it "正気 己" do
      subject.zoukan(12).code.to_s.should == "5"
      subject.zoukan(30).code.to_s.should == "5"
  end
 end

 describe "寅" do

  subject{Junishi.find_by_code(2)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(6).code.to_s.should == "4"
  end
  it "中気 丙" do
      subject.zoukan(7).code.to_s.should == "2"
      subject.zoukan(13).code.to_s.should == "2"
  end
  it "正気 甲" do
      subject.zoukan(14).code.to_s.should == "0"
      subject.zoukan(30).code.to_s.should == "0"
  end
 end

 describe "卯" do

  subject{Junishi.find_by_code(3)}
  it "余気 甲" do
      subject.zoukan(0).code.to_s.should == "0"
      subject.zoukan(9).code.to_s.should == "0"
  end
  it "正気 乙" do
      subject.zoukan(10).code.to_s.should == "1"
      subject.zoukan(30).code.to_s.should == "1"
  end
 end

 describe "辰" do

  subject{Junishi.find_by_code(4)}
  it "余気 乙" do
      subject.zoukan(0).code.to_s.should == "1"
      subject.zoukan(8).code.to_s.should == "1"
  end
  it "中気 癸" do
      subject.zoukan(9).code.to_s.should == "9"
      subject.zoukan(11).code.to_s.should == "9"
  end
  it "正気 戊" do
      subject.zoukan(12).code.to_s.should == "4"
      subject.zoukan(30).code.to_s.should == "4"
  end
 end

 describe "巳" do

  subject{Junishi.find_by_code(5)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(6).code.to_s.should == "4"
  end
  it "中気 庚" do
      subject.zoukan(7).code.to_s.should == "6"
      subject.zoukan(13).code.to_s.should == "6"
  end
  it "正気 丙" do
      subject.zoukan(14).code.to_s.should == "2"
      subject.zoukan(30).code.to_s.should == "2"
  end
 end

 describe "午" do

  subject{Junishi.find_by_code(6)}
  it "余気 丙" do
      subject.zoukan(0).code.to_s.should == "2"
      subject.zoukan(9).code.to_s.should == "2"
  end
  it "中気 己" do
      subject.zoukan(10).code.to_s.should == "5"
      subject.zoukan(16).code.to_s.should == "5"
  end
  it "正気 丁" do
      subject.zoukan(17).code.to_s.should == "3"
      subject.zoukan(30).code.to_s.should == "3"
  end
 end

 describe "未" do

  subject{Junishi.find_by_code(7)}
  it "余気 丁" do
      subject.zoukan(0).code.to_s.should == "3"
      subject.zoukan(8).code.to_s.should == "3"
  end
  it "中気 乙" do
      subject.zoukan(9).code.to_s.should == "1"
      subject.zoukan(11).code.to_s.should == "1"
  end
  it "正気 己" do
      subject.zoukan(12).code.to_s.should == "5"
      subject.zoukan(30).code.to_s.should == "5"
  end
 end


 describe "申" do

  subject{Junishi.find_by_code(8)}
  it "余気 己" do
      subject.zoukan(0).code.to_s.should == "5"
      subject.zoukan(6).code.to_s.should == "5"
  end
  it "中気 壬" do
      subject.zoukan(7).code.to_s.should == "8"
      subject.zoukan(13).code.to_s.should == "8"
  end
  it "正気 庚" do
      subject.zoukan(14).code.to_s.should == "6"
      subject.zoukan(30).code.to_s.should == "6"
  end
 end


 describe "酉" do

  subject{Junishi.find_by_code(9)}
  it "余気 庚" do
      subject.zoukan(0).code.to_s.should == "6"
      subject.zoukan(9).code.to_s.should == "6"
  end
  it "正気 辛" do
      subject.zoukan(10).code.to_s.should == "7"
      subject.zoukan(30).code.to_s.should == "7"
  end
 end

 describe "戌" do

  subject{Junishi.find_by_code(10)}
  it "余気 辛" do
      subject.zoukan(0).code.to_s.should == "7"
      subject.zoukan(8).code.to_s.should == "7"
  end
  it "中気 丁" do
      subject.zoukan(9).code.to_s.should == "3"
      subject.zoukan(11).code.to_s.should == "3"
  end
  it "正気 戊" do
      subject.zoukan(12).code.to_s.should == "4"
      subject.zoukan(30).code.to_s.should == "4"
  end
 end

 describe "亥" do

  subject{Junishi.find_by_code(11)}
  it "余気 戊" do
      subject.zoukan(0).code.to_s.should == "4"
      subject.zoukan(6).code.to_s.should == "4"
  end
  it "中気 甲" do
      subject.zoukan(7).code.to_s.should == "0"
      subject.zoukan(13).code.to_s.should == "0"
  end
  it "正気 壬" do
      subject.zoukan(14).code.to_s.should == "8"
      subject.zoukan(30).code.to_s.should == "8"
  end
 end
end

describe Junishi, "天徳取得" do

 before do
       read_jikkan()
       read_junishi()
       read_tentoku()
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
      subject[0].name.should == "乙"
      subject[1].name.should == "庚"
  end
 end

 describe "寅" do

  subject{Junishi.find_by_code(2).tentoku}
  it "天徳" do
      subject[0].name.should == "壬"
      subject[1].name.should == "丁"
  end
 end

 describe "卯" do

  subject{Junishi.find_by_code(3).tentoku}
  it "天徳" do
      subject[0].name.should == "巳"
      subject[1].name.should == "申"
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
      subject[0].name.should == "丙"
      subject[1].name.should == "辛"
  end
 end

 describe "午" do

  subject{Junishi.find_by_code(6).tentoku}
  it "天徳" do
      subject[0].name.should == "寅"
      subject[1].name.should == "亥"
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
      subject[0].name.should == "戊"
      subject[1].name.should == "癸"
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
      subject[0].name.should == "庚"
      subject[1].name.should == "乙"
  end
 end
end
