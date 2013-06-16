# coding : utf-8

require 'spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe MeishikiPlr, "四柱" do
 let(:current_day){Time.new(1982,03,29,15,00,00)}
 let(:meishiki){Meishiki.create(:birthday=>current_day)}
 
 before do
   read_all_seeds()
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

 describe "関連" do
  describe "刑" do
    let(:year_pillar){YearPillar.new(:chishi_id => 1)}
    let(:month_pillar){MonthPillar.new(:chishi_id => 4)}
    let(:day_pillar){DayPillar.new(:chishi_id => 4)}
    let(:time_pillar){TimePillar.new(:chishi_id => 4)}

    it "年柱" do
      year_pillar.kei?(:target_pillar => month_pillar).should == true
    end

    it "月柱" do
      month_pillar.kei?(:target_pillar => year_pillar).should == true
    end

    it "日柱" do
      day_pillar.kei?(:target_pillar => year_pillar).should == true
    end

    it "時柱" do
      time_pillar.kei?(:target_pillar => year_pillar).should == true
    end
  end

   describe "冲" do
     let(:year_pillar){YearPillar.new(:chishi_id => 1)}
     let(:month_pillar){MonthPillar.new(:chishi_id => 7)}
     let(:day_pillar){DayPillar.new(:chishi_id => 7)}
     let(:time_pillar){TimePillar.new(:chishi_id => 7)}

     it "年柱" do
       year_pillar.chu?(:target_pillar => month_pillar).should == true
     end

     it "月柱" do
       month_pillar.chu?(:target_pillar => year_pillar).should == true
     end

     it "日柱" do
       day_pillar.chu?(:target_pillar => year_pillar).should == true
     end

     it "時柱" do
       time_pillar.respond_to?(:chu?).should == false
     end
   end

  describe "破" do
    let(:year_pillar){YearPillar.new(:chishi_id => 1)}
    let(:month_pillar){MonthPillar.new(:chishi_id => 10)}
    let(:day_pillar){DayPillar.new(:chishi_id => 10)}
    let(:time_pillar){TimePillar.new(:chishi_id => 10)}

    it "年柱" do
      year_pillar.ha?(:target_pillar => month_pillar).should == true
    end

    it "月柱" do
      month_pillar.ha?(:target_pillar => year_pillar).should == true
    end

    it "日柱" do
      day_pillar.ha?(:target_pillar => year_pillar).should == true
    end

    it "時柱" do
      time_pillar.respond_to?(:ha?).should == false
    end
  end

  describe "害" do
    let(:year_pillar){YearPillar.new(:chishi_id => 1)}
    let(:month_pillar){MonthPillar.new(:chishi_id => 8)}
    let(:day_pillar){DayPillar.new(:chishi_id => 8)}
    let(:time_pillar){TimePillar.new(:chishi_id => 8)}

    it "年柱" do
      year_pillar.gai?(:target_pillar => month_pillar).should == true
    end

    it "月柱" do
      month_pillar.gai?(:target_pillar => year_pillar).should == true
    end

    it "日柱" do
      day_pillar.gai?(:target_pillar => year_pillar).should == true
    end

    it "時柱" do
      time_pillar.respond_to?(:gai?).should == false
    end
  end

  describe "支合" do
    let(:year_pillar){YearPillar.new(:chishi_id => 3)}
    let(:month_pillar){MonthPillar.new(:chishi_id => 12)}
    let(:day_pillar){DayPillar.new(:chishi_id => 12)}
    let(:time_pillar){TimePillar.new(:chishi_id => 12)}

    it "年柱" do
      year_pillar.shigou?(:target_pillar => month_pillar).should == true
    end

    it "月柱" do
      month_pillar.shigou?(:target_pillar => year_pillar).should == true
    end

    it "日柱" do
      day_pillar.shigou?(:target_pillar => year_pillar).should == true
    end

    it "時柱" do
      time_pillar.respond_to?(:shigou?).should == false
    end
  end

  describe "三合" do
    let(:year_pillar){YearPillar.new(:chishi_id => 1)}
    let(:month_pillar){MonthPillar.new(:chishi_id => 5)}
    let(:day_pillar){DayPillar.new(:chishi_id => 9)}
    let(:time_pillar){TimePillar.new(:chishi_id => 1)}

    it "年柱" do
      year_pillar.sangou?(:target_pillar => month_pillar, :target2_pillar => day_pillar).should == true
    end

    it "月柱" do
      month_pillar.sangou?(:target_pillar => day_pillar, :target2_pillar => time_pillar).should == true
    end
  end

 end

 describe "天徳貴人" do
   let(:year_pillar){YearPillar.new(:chishi_id => 6)}
   let(:month_pillar){MonthPillar.new(:chishi_id => 1)}
   let(:day_pillar){DayPillar.new(:chishi_id => 6)}
   let(:time_pillar){TimePillar.new(:chishi_id => 6)}

   it "年柱" do
     month_pillar.tentoku_kijin?(:target_pillar => year_pillar).should == true
   end

   it "月柱" do
     month_pillar.tentoku_kijin?(:target_pillar => month_pillar).should == false
   end

   it "日柱" do
     month_pillar.tentoku_kijin?(:target_pillar => day_pillar).should == true
   end

   it "時柱" do
     month_pillar.tentoku_kijin?(:target_pillar => time_pillar).should == true
   end
 end

 describe "天徳貴人" do
   let(:year_pillar){YearPillar.new(:tenkan_id => 7)}
   let(:month_pillar){MonthPillar.new(:tenkan_id => 7, :chishi_id => 2)}
   let(:day_pillar){DayPillar.new(:tenkan_id => 7)}
   let(:time_pillar){TimePillar.new(:tenkan_id => 7)}

   it "年柱" do
     month_pillar.tentoku_kijin?(:target_pillar => year_pillar).should == true
   end

   it "月柱" do
     month_pillar.tentoku_kijin?(:target_pillar => month_pillar).should == true
   end

   it "日柱" do
     month_pillar.tentoku_kijin?(:target_pillar => day_pillar).should == true
   end

   it "時柱" do
     month_pillar.tentoku_kijin?(:target_pillar => time_pillar).should == true
   end
 end

 describe "天徳合" do
   let(:year_pillar){YearPillar.new(:chishi_id => 9)}
   let(:month_pillar){MonthPillar.new(:chishi_id => 1)}
   let(:day_pillar){DayPillar.new(:chishi_id => 9)}
   let(:time_pillar){TimePillar.new(:chishi_id => 9)}

   it "年柱" do
     month_pillar.tentoku_gou?(:target_pillar => year_pillar).should == true
   end

   it "月柱" do
     month_pillar.tentoku_gou?(:target_pillar => month_pillar).should == false
   end

   it "日柱" do
     month_pillar.tentoku_gou?(:target_pillar => day_pillar).should == true
   end

   it "時柱" do
     month_pillar.tentoku_gou?(:target_pillar => time_pillar).should == true
   end
 end

 describe "天徳合" do
   let(:year_pillar){YearPillar.new(:tenkan_id => 2)}
   let(:month_pillar){MonthPillar.new(:tenkan_id => 2, :chishi_id => 2)}
   let(:day_pillar){DayPillar.new(:tenkan_id => 2)}
   let(:time_pillar){TimePillar.new(:tenkan_id => 2)}

   it "年柱" do
     month_pillar.tentoku_gou?(:target_pillar => year_pillar).should == true
   end

   it "月柱" do
     month_pillar.tentoku_gou?(:target_pillar => month_pillar).should == true
   end

   it "日柱" do
     month_pillar.tentoku_gou?(:target_pillar => day_pillar).should == true
   end

   it "時柱" do
     month_pillar.tentoku_gou?(:target_pillar => time_pillar).should == true
   end
 end

 describe "喪門" do
   let(:year_pillar){YearPillar.new(:chishi_id => 3)}
   let(:month_pillar){MonthPillar.new(:chishi_id => 1)}
   let(:day_pillar){DayPillar.new(:chishi_id => 3)}
   let(:time_pillar){TimePillar.new(:chishi_id => 3)}

   it "年柱" do
     month_pillar.momon?(:target_pillar => year_pillar).should == true
   end

   it "日柱" do
     month_pillar.momon?(:target_pillar => day_pillar).should == true
   end

   it "時柱" do
     month_pillar.momon?(:target_pillar => time_pillar).should == true
   end
 end

end
