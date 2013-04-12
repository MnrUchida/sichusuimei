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
   let(:year_piller){YearPiller.new(:meishiki_id => meishiki.id)}

   before do
     year_piller.set_initial_value
   end

  it "命式" do
    year_piller.meishiki.id.to_s.should == meishiki.id.to_s
  end
  it "天干" do
    year_piller.tenkan_id.to_s.should == "9"
    year_piller.tenkan.name.should == "壬"
  end
  it "地支" do
    year_piller.chishi.name.should == "戌"
  end
  it "蔵干" do
    year_piller.zoukan.name.should == "戊"
  end

  it "五行" do
   year_piller.gogyo[2].should == 1
  end
 end

 describe "月柱" do
   let(:month_piller){MonthPiller.new(:meishiki_id => meishiki.id)}

   before do
     month_piller.set_initial_value
   end

  it "天干" do
    month_piller.tenkan.name.should == "癸"
  end
  it "地支" do
    month_piller.chishi.name.should == "卯"
  end
  it "蔵干" do
    month_piller.zoukan.name.should == "乙"
  end
 end

 describe "日柱" do
   let(:day_piller){DayPiller.new(:meishiki_id => meishiki.id)}

   before do
     day_piller.set_initial_value
   end

  it "天干" do
    day_piller.tenkan.name.should == "辛"
  end
  it "地支" do
    day_piller.chishi.name.should == "亥"
  end
  it "蔵干" do
    day_piller.zoukan.name.should == "壬"
  end
 end

 describe "時柱" do
   let(:time_piller){TimePiller.new(:meishiki_id => meishiki.id)}

   before do
     time_piller.set_initial_value
   end

  it "天干" do
    time_piller.tenkan.name.should == "丙"
  end
  it "地支" do
    time_piller.chishi.name.should == "申"
  end
  it "蔵干" do
    time_piller.zoukan.name.should == "庚"
  end
 end

end
