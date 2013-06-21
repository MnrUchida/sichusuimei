# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Jikkan, "変通星取得" do

  before do
    read_all_seeds()
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
   read_all_seeds()
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
    read_all_seeds()
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

describe Jikkan, "大極貴人" do
  describe "一つ目" do
    shared_examples_for :taikyoku_kijin_1_check_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_1?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :taikyoku_kijin_1_get_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_1}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'ne', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'ne', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'u', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'u', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'tatsu', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'tatsu', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'tora', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'tora', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'mi', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'mi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :taikyoku_kijin_1_check_validation, pattern
      it_behaves_like :taikyoku_kijin_1_get_validation, pattern
    end
  end

  describe "二つ目" do
    shared_examples_for :taikyoku_kijin_2_check_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_2?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :taikyoku_kijin_2_get_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_2}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'uma', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'uma', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'tori', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'i', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'i', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'saru', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'saru', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :taikyoku_kijin_2_check_validation, pattern
      it_behaves_like :taikyoku_kijin_2_get_validation, pattern
    end
  end

  describe "三つ目" do
    shared_examples_for :taikyoku_kijin_3_check_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_3?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :taikyoku_kijin_3_get_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_3}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => nil, :expected_value => true},
                     {:key => 'kinoto', :relation_value => nil, :expected_value => true},
                     {:key => 'hinoe', :relation_value => nil, :expected_value => true},
                     {:key => 'hinoto', :relation_value => nil, :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'inu', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'inu', :expected_value => true},
                     {:key => 'kanoe', :relation_value => nil, :expected_value => true},
                     {:key => 'kanoto', :relation_value => nil, :expected_value => true},
                     {:key => 'mizunoe', :relation_value => nil, :expected_value => true},
                     {:key => 'mizunoto', :relation_value => nil, :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :taikyoku_kijin_3_check_validation, pattern
      it_behaves_like :taikyoku_kijin_3_get_validation, pattern
    end
  end

  describe "四つ目" do
    shared_examples_for :taikyoku_kijin_4_check_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_4?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :taikyoku_kijin_4_get_validation do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_4}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => nil, :expected_value => true},
                     {:key => 'kinoto', :relation_value => nil, :expected_value => true},
                     {:key => 'hinoe', :relation_value => nil, :expected_value => true},
                     {:key => 'hinoto', :relation_value => nil, :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'usi', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'usi', :expected_value => true},
                     {:key => 'kanoe', :relation_value => nil, :expected_value => true},
                     {:key => 'kanoto', :relation_value => nil, :expected_value => true},
                     {:key => 'mizunoe', :relation_value => nil, :expected_value => true},
                     {:key => 'mizunoto', :relation_value => nil, :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :taikyoku_kijin_4_check_validation, pattern
      it_behaves_like :taikyoku_kijin_4_get_validation, pattern
    end
  end

end

describe Jikkan, "天乙貴人" do
  describe "一つ目" do
    shared_examples_for :tenotsu_kijin_1_check_validation do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_1?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :tenotsu_kijin_1_get_validation do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_1}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'usi', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'saru', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'i', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'i', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'usi', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'saru', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'usi', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'tora', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'mi', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'mi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tenotsu_kijin_1_check_validation, pattern
      it_behaves_like :tenotsu_kijin_1_get_validation, pattern
    end
  end

  describe "二つ目" do
    shared_examples_for :tenotsu_kijin_2_check_validation do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_2?(relation)}
      it_behaves_like :relation_check_validation_junishi, params
    end

    shared_examples_for :tenotsu_kijin_2_get_validation do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_2}
      it_behaves_like :relation_get_validation_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'ne', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'tori', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'ne', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'uma', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'u', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'u', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tenotsu_kijin_2_check_validation, pattern
      it_behaves_like :tenotsu_kijin_2_get_validation, pattern
    end
  end
end

describe Jikkan, "天官貴人" do
  shared_examples_for :tenkan_kijin_check_validation do |params|
    subject{Jikkan.by_key(key).tenkan_kijin?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :tenkan_kijin_get_validation do |params|
    subject{Jikkan.by_key(key).tenkan_kijin}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'inu', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'u', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'saru', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'uma', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :tenkan_kijin_check_validation, pattern
    it_behaves_like :tenkan_kijin_get_validation, pattern
  end
end

describe Jikkan, "天福貴人" do
  shared_examples_for :tenhuku_kijin_check_validation do |params|
    subject{Jikkan.by_key(key).tenhuku_kijin?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :tenhuku_kijin_get_validation do |params|
    subject{Jikkan.by_key(key).tenhuku_kijin}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'usi', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'mi', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :tenhuku_kijin_check_validation, pattern
    it_behaves_like :tenhuku_kijin_get_validation, pattern
  end
end

describe Jikkan, "暗禄" do
  shared_examples_for :anroku_check_validation do |params|
    subject{Jikkan.by_key(key).anroku?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :anroku_get_validation do |params|
    subject{Jikkan.by_key(key).anroku}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'inu', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :anroku_check_validation, pattern
    it_behaves_like :anroku_get_validation, pattern
  end
end

describe Jikkan, "干禄" do
  shared_examples_for :kanroku_check_validation do |params|
    subject{Jikkan.by_key(key).kanroku?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :kanroku_get_validation do |params|
    subject{Jikkan.by_key(key).kanroku}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'u', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'ne', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :kanroku_check_validation, pattern
    it_behaves_like :kanroku_get_validation, pattern
  end
end

describe Jikkan, "富貴学童" do
  shared_examples_for :fukigakudo_check_validation do |params|
    subject{Jikkan.by_key(key).fukigakudo?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :fukigakudo_get_validation do |params|
    subject{Jikkan.by_key(key).fukigakudo}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'ne', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'u', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :fukigakudo_check_validation, pattern
    it_behaves_like :fukigakudo_get_validation, pattern
  end
end

describe Jikkan, "天厨貴人" do
  shared_examples_for :tenchukijin_check_validation do |params|
    subject{Jikkan.by_key(key).tenchukijin?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :tenchukijin_get_validation do |params|
    subject{Jikkan.by_key(key).tenchukijin}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'ne', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'u', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :tenchukijin_check_validation, pattern
    it_behaves_like :tenchukijin_get_validation, pattern
  end
end

describe Jikkan, "金輿禄" do
  shared_examples_for :kinyoroku_check_validation do |params|
    subject{Jikkan.by_key(key).kinyoroku?(relation)}
    it_behaves_like :relation_check_validation_junishi, params
  end

  shared_examples_for :kinyoroku_get_validation do |params|
    subject{Jikkan.by_key(key).kinyoroku}
    it_behaves_like :relation_get_validation_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'mi', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'hitsuji', :expected_value => true},
                   {:key=> 'tsuchinoto', :relation_value => 'saru', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'inu', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'i', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'usi', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'tora', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :kinyoroku_check_validation, pattern
    it_behaves_like :kinyoroku_get_validation, pattern
  end
end
