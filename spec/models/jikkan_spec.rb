# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'

describe Jikkan, "変通星取得" do

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
  shared_examples_for :kangou_check do |params|
    subject{Jikkan.by_key(key).gou?(relation)}
    it_behaves_like :relation_check_for_jikkan, params
  end

  shared_examples_for :kangou_get do |params|
    subject{Jikkan.by_key(key).gou}
    it_behaves_like :relation_get_for_jikkan, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tsuchinoto', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'kanoe', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'kanoto', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'mizunoe', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'mizunoto', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'kinoe', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'kinoto', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'hinoe', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'hinoto', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'tsuchinoe', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :kangou_check, pattern
    it_behaves_like :kangou_get, pattern
  end
end

describe Jikkan, "大極貴人" do
  describe "一つ目" do
    shared_examples_for :taikyoku_kijin_1_check do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_1?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :taikyoku_kijin_1_get do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_1}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :taikyoku_kijin_1_check, pattern
      it_behaves_like :taikyoku_kijin_1_get, pattern
    end
  end

  describe "二つ目" do
    shared_examples_for :taikyoku_kijin_2_check do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_2?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :taikyoku_kijin_2_get do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_2}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :taikyoku_kijin_2_check, pattern
      it_behaves_like :taikyoku_kijin_2_get, pattern
    end
  end

  describe "三つ目" do
    shared_examples_for :taikyoku_kijin_3_check do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_3?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :taikyoku_kijin_3_get do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_3}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :taikyoku_kijin_3_check, pattern
      it_behaves_like :taikyoku_kijin_3_get, pattern
    end
  end

  describe "四つ目" do
    shared_examples_for :taikyoku_kijin_4_check do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_4?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :taikyoku_kijin_4_get do |params|
      subject{Jikkan.by_key(key).taikyoku_kijin_4}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :taikyoku_kijin_4_check, pattern
      it_behaves_like :taikyoku_kijin_4_get, pattern
    end
  end

end

describe Jikkan, "天乙貴人" do
  describe "一つ目" do
    shared_examples_for :tenotsu_kijin_1_check do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_1?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :tenotsu_kijin_1_get do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_1}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :tenotsu_kijin_1_check, pattern
      it_behaves_like :tenotsu_kijin_1_get, pattern
    end
  end

  describe "二つ目" do
    shared_examples_for :tenotsu_kijin_2_check do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_2?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :tenotsu_kijin_2_get do |params|
      subject{Jikkan.by_key(key).tenotsu_kijin_2}
      it_behaves_like :relation_get_for_junishi, params
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
      it_behaves_like :tenotsu_kijin_2_check, pattern
      it_behaves_like :tenotsu_kijin_2_get, pattern
    end
  end
end

describe Jikkan, "天官貴人" do
  shared_examples_for :tenkan_kijin_check do |params|
    subject{Jikkan.by_key(key).tenkan_kijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :tenkan_kijin_get do |params|
    subject{Jikkan.by_key(key).tenkan_kijin}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :tenkan_kijin_check, pattern
    it_behaves_like :tenkan_kijin_get, pattern
  end
end

describe Jikkan, "天福貴人" do
  shared_examples_for :tenhuku_kijin_check do |params|
    subject{Jikkan.by_key(key).tenhuku_kijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :tenhuku_kijin_get do |params|
    subject{Jikkan.by_key(key).tenhuku_kijin}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :tenhuku_kijin_check, pattern
    it_behaves_like :tenhuku_kijin_get, pattern
  end
end

describe Jikkan, "暗禄" do
  shared_examples_for :anroku_check do |params|
    subject{Jikkan.by_key(key).anroku?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :anroku_get do |params|
    subject{Jikkan.by_key(key).anroku}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :anroku_check, pattern
    it_behaves_like :anroku_get, pattern
  end
end

describe Jikkan, "干禄" do
  shared_examples_for :kanroku_check do |params|
    subject{Jikkan.by_key(key).kanroku?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :kanroku_get do |params|
    subject{Jikkan.by_key(key).kanroku}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :kanroku_check, pattern
    it_behaves_like :kanroku_get, pattern
  end
end

describe Jikkan, "富貴学童" do
  shared_examples_for :fukigakudo_check do |params|
    subject{Jikkan.by_key(key).fukigakudo?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :fukigakudo_get do |params|
    subject{Jikkan.by_key(key).fukigakudo}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :fukigakudo_check, pattern
    it_behaves_like :fukigakudo_get, pattern
  end
end

describe Jikkan, "天厨貴人" do
  shared_examples_for :tenchukijin_check do |params|
    subject{Jikkan.by_key(key).tenchukijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :tenchukijin_get do |params|
    subject{Jikkan.by_key(key).tenchukijin}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :tenchukijin_check, pattern
    it_behaves_like :tenchukijin_get, pattern
  end
end

describe Jikkan, "金輿禄" do
  shared_examples_for :kinyoroku_check do |params|
    subject{Jikkan.by_key(key).kinyoroku?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :kinyoroku_get do |params|
    subject{Jikkan.by_key(key).kinyoroku}
    it_behaves_like :relation_get_for_junishi, params
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
    it_behaves_like :kinyoroku_check, pattern
    it_behaves_like :kinyoroku_get, pattern
  end
end

describe Jikkan, "学士" do
  shared_examples_for :gakushi_check do |params|
    subject{Jikkan.by_key(key).gakushi?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :gakushi_get do |params|
    subject{Jikkan.by_key(key).gakushi}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'i', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'u', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tora', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'mi', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tori', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'saru', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :gakushi_check, pattern
    it_behaves_like :gakushi_get, pattern
  end
end

describe Jikkan, "天財" do
  shared_examples_for :tenzai_check do |params|
    subject{Jikkan.by_key(key).tenzai?(relation)}
    it_behaves_like :relation_check_for_jikkan, params
  end

  shared_examples_for :tenzai_get do |params|
    subject{Jikkan.by_key(key).tenzai}
    it_behaves_like :relation_get_for_jikkan, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tsuchinoe', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'tsuchinoto', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'kanoe', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'kanoto', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'mizunoe', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'mizunoto', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'kinoe', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'kinoto', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'hinoe', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'hinoto', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :tenzai_check, pattern
    it_behaves_like :tenzai_get, pattern
  end
end

describe Jikkan, "夾禄" do
  describe "1つ目" do
    shared_examples_for :kyoroku_1_check do |params|
      subject{Jikkan.by_key(key).kyoroku_1?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :kyoroku_1_get do |params|
      subject{Jikkan.by_key(key).kyoroku_1}
      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'usi', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'tora', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'tatsu', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'mi', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'tatsu', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'mi', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'saru', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'inu', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'i', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :kyoroku_1_check, pattern
      it_behaves_like :kyoroku_1_get, pattern
    end
  end

  describe "2つ目" do
    shared_examples_for :kyoroku_2_check do |params|
      subject{Jikkan.by_key(key).kyoroku_2?(relation)}
      it_behaves_like :relation_check_for_junishi, params
    end

    shared_examples_for :kyoroku_2_get do |params|
      subject{Jikkan.by_key(key).kyoroku_2}
      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'u', :expected_value => true},
                     {:key => 'kinoto', :relation_value => 'tatsu', :expected_value => true},
                     {:key => 'hinoe', :relation_value => 'uma', :expected_value => true},
                     {:key => 'hinoto', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'tsuchinoe', :relation_value => 'uma', :expected_value => true},
                     {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                     {:key => 'kanoe', :relation_value => 'tori', :expected_value => true},
                     {:key => 'kanoto', :relation_value => 'inu', :expected_value => true},
                     {:key => 'mizunoe', :relation_value => 'ne', :expected_value => true},
                     {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :kyoroku_2_check, pattern
      it_behaves_like :kyoroku_2_get, pattern
    end
  end
end

describe Jikkan, "羊刃" do
  shared_examples_for :youjin_check do |params|
    subject{Jikkan.by_key(key).youjin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :youjin_get do |params|
    subject{Jikkan.by_key(key).youjin}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'u', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'inu', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :youjin_check, pattern
    it_behaves_like :youjin_get, pattern
  end
end

describe Jikkan, "飛刃" do
  shared_examples_for :hijin_check do |params|
    subject{Jikkan.by_key(key).hijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :hijin_get do |params|
    subject{Jikkan.by_key(key).hijin}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'inu', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'usi', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'usi', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'u', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'hitsuji', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :hijin_check, pattern
    it_behaves_like :hijin_get, pattern
  end
end

describe Jikkan, "紅艶" do
  shared_examples_for :kouen_check do |params|
    subject{Jikkan.by_key(key).kouen?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :kouen_get do |params|
    subject{Jikkan.by_key(key).kouen}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'inu', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'ne', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'saru', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :kouen_check, pattern
    it_behaves_like :kouen_get, pattern
  end
end

describe Jikkan, "流霞" do
  shared_examples_for :ryuka_check do |params|
    subject{Jikkan.by_key(key).ryuka?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :ryuka_get do |params|
    subject{Jikkan.by_key(key).ryuka}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'inu', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'u', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'tora', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :ryuka_check, pattern
    it_behaves_like :ryuka_get, pattern
  end
end

describe Jikkan, "福星貴人" do
  shared_examples_for :fukusei_kijin_check do |params|
    subject{Jikkan.by_key(key).fukusei_kijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :fukusei_kijin_get do |params|
    subject{Jikkan.by_key(key).fukusei_kijin}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'usi', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'uma', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'mi', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tatsu', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :fukusei_kijin_check, pattern
    it_behaves_like :fukusei_kijin_get, pattern
  end
end

describe Jikkan, "文星貴人" do
  shared_examples_for :bunsei_kijin_check do |params|
    subject{Jikkan.by_key(key).bunsei_kijin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :bunsei_kijin_get do |params|
    subject{Jikkan.by_key(key).bunsei_kijin}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'uma', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'saru', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'tori', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'ne', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'tora', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'u', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :bunsei_kijin_check, pattern
    it_behaves_like :bunsei_kijin_get, pattern
  end
end

describe Jikkan, "節度人" do
  shared_examples_for :setsudojin_check do |params|
    subject{Jikkan.by_key(key).setsudojin?(relation)}
    it_behaves_like :relation_check_for_junishi, params
  end

  shared_examples_for :setsudojin_get do |params|
    subject{Jikkan.by_key(key).setsudojin}
    it_behaves_like :relation_get_for_junishi, params
  end

  test_patterns = [{:key => 'kinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'kinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'hinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'hinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'tsuchinoe', :relation_value => 'mi', :expected_value => true},
                   {:key => 'tsuchinoto', :relation_value => 'hitsuji', :expected_value => true},
                   {:key => 'kanoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'kanoto', :relation_value => 'usi', :expected_value => true},
                   {:key => 'mizunoe', :relation_value => 'i', :expected_value => true},
                   {:key => 'mizunoto', :relation_value => 'usi', :expected_value => true}]

  test_patterns.each do |pattern|
    it_behaves_like :setsudojin_check, pattern
    it_behaves_like :setsudojin_get, pattern
  end
end
