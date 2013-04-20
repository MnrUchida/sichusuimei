# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe MeishikiPlr, "四柱" do
 let(:current_day){Time.new(1982,03,29,15,00,00)}
 let(:meishiki){Meishiki.create(:birthday=>current_day)}
 
 before do
   read_gogyo()
   read_junishi()
   read_jikkan()
   read_junishi_term()
   read_junishi_gogyo()
   Sekki.create(:year => 1982, :month=>3, :day=>7, :hour=>7)
 end

 describe "年柱" do
  it "命式" do
    meishiki.year_pillar.meishiki.id.to_s.should == meishiki.id.to_s
  end
  it "天干" do
    meishiki.year_pillar.tenkan_id.to_s.should == "9"
    meishiki.year_pillar.tenkan.name.should == "壬"
  end
  it "地支" do
    meishiki.year_pillar.chishi.name.should == "戌"
  end
  it "蔵干" do
    meishiki.year_pillar.zoukan.name.should == "戊"
  end
 end

 describe "月柱" do

  it "天干" do
    meishiki.month_pillar.tenkan.name.should == "癸"
  end
  it "地支" do
    meishiki.month_pillar.chishi.name.should == "卯"
  end
  it "蔵干" do
    meishiki.month_pillar.zoukan.name.should == "乙"
  end
 end

 describe "日柱" do
  it "天干" do
    meishiki.day_pillar.tenkan.name.should == "辛"
  end
  it "地支" do
    meishiki.day_pillar.chishi.name.should == "亥"
  end
  it "蔵干" do
    meishiki.day_pillar.zoukan.name.should == "壬"
  end
 end

 describe "時柱" do
  it "天干" do
    meishiki.time_pillar.tenkan.name.should == "丙"
  end
  it "地支" do
    meishiki.time_pillar.chishi.name.should == "申"
  end
  it "蔵干" do
    meishiki.time_pillar.zoukan.name.should == "庚"
  end
 end

 it "五行" do
   meishiki.gogyo[2].should == 1
 end

end
