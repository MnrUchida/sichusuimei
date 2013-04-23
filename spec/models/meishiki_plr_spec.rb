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
   let(:year_pillar){YearPillar.new(:meishiki_id => meishiki.id)}

   before do
     year_pillar.set_initial_value
   end

  it "命式" do
    year_pillar.meishiki.id.to_s.should == meishiki.id.to_s
  end
  it "天干" do
    year_pillar.tenkan_id.to_s.should == "9"
    year_pillar.tenkan.name.should == "壬"
  end
  it "地支" do
    year_pillar.chishi.name.should == "戌"
  end
  it "蔵干" do
    year_pillar.zoukan.name.should == "戊"
  end
   
   it "空亡" do
     year_pillar.kubou[0].name.should == "子"
     year_pillar.kubou[1].name.should == "丑"
   end

  it "五行" do
   year_pillar.gogyo[2].should == 1
  end
 end

 describe "月柱" do
   let(:month_pillar){MonthPillar.new(:meishiki_id => meishiki.id)}

   before do
     month_pillar.set_initial_value
   end

  it "天干" do
    month_pillar.tenkan.name.should == "癸"
  end
  it "地支" do
    month_pillar.chishi.name.should == "卯"
  end
  it "蔵干" do
    month_pillar.zoukan.name.should == "乙"
  end

   it "空亡" do
     month_pillar.kubou[0].name.should == "辰"
     month_pillar.kubou[1].name.should == "巳"
   end
 end

 describe "日柱" do
   let(:day_pillar){DayPillar.new(:meishiki_id => meishiki.id)}

   before do
     day_pillar.set_initial_value
   end

  it "天干" do
    day_pillar.tenkan.name.should == "辛"
  end
  it "地支" do
    day_pillar.chishi.name.should == "亥"
  end
  it "蔵干" do
    day_pillar.zoukan.name.should == "壬"
  end

   it "空亡" do
     day_pillar.kubou[0].name.should == "寅"
     day_pillar.kubou[1].name.should == "卯"
   end
 end

 describe "時柱" do
   let(:time_pillar){TimePillar.new(:meishiki_id => meishiki.id)}

   before do
     time_pillar.set_initial_value
   end

  it "天干" do
    time_pillar.tenkan.name.should == "丙"
  end
  it "地支" do
    time_pillar.chishi.name.should == "申"
  end
  it "蔵干" do
    time_pillar.zoukan.name.should == "庚"
  end

   it "空亡" do
     time_pillar.kubou[0].name.should == "辰"
     time_pillar.kubou[1].name.should == "巳"
   end
 end

end
