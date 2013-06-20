# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'
require 'seeds_from_csv'
include SeedsFromCsv

describe Junishi, "十二支のテスト" do
  before do
    read_all_seeds()
  end

  subject{Junishi.by_key(key)}

  describe Junishi, "蔵干取得" do

    shared_examples_for :zoukan_validation do |params|
      params.each do |param|
        param[:days].each do |day|
          it{ subject.zoukan(day).name.should == param[:expected_value] }
        end
      end
    end

    describe "子" do
      let(:key){'ne'}

      it_behaves_like :zoukan_validation, [{:days => [0, 10], :expected_value => "壬"},
                                           {:days => [11, 30], :expected_value => "癸"}]
    end

    describe "丑" do
      let(:key){'usi'}

      it_behaves_like :zoukan_validation, [{:days => [0, 9], :expected_value => "癸"} ,
                                           {:days => [10, 12], :expected_value => "辛"} ,
                                           {:days => [13, 30], :expected_value => "己"}]
    end

    describe "寅" do
      let(:key){'tora'}

      it_behaves_like :zoukan_validation, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "丙"},
                                           {:days => [15, 30], :expected_value => "甲"}]
    end

    describe "卯" do
      let(:key){'u'}

      it_behaves_like :zoukan_validation, [{:days => [0, 10], :expected_value => "甲"},
                                           {:days => [11, 30], :expected_value => "乙"}]
    end

    describe "辰" do
      let(:key){'tatsu'}

      it_behaves_like :zoukan_validation, [{:days => [0, 9], :expected_value => "乙"},
                                           {:days => [10, 12], :expected_value => "癸"},
                                           {:days => [13, 30], :expected_value => "戊"}]
    end

    describe "巳" do
      let(:key){'mi'}

      it_behaves_like :zoukan_validation, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "庚"},
                                           {:days => [15, 30], :expected_value => "丙"}]
    end

    describe "午" do
      let(:key){'uma'}

      it_behaves_like :zoukan_validation, [{:days => [0, 10], :expected_value => "丙"},
                                           {:days => [11, 17], :expected_value => "己"},
                                           {:days => [18, 30], :expected_value => "丁"}]
    end

    describe "未" do
      let(:key){'hitsuji'}

      it_behaves_like :zoukan_validation, [{:days => [0, 9], :expected_value => "丁"},
                                           {:days => [10, 12], :expected_value => "乙"},
                                           {:days => [13, 30], :expected_value => "己"}]
    end

    describe "申" do
      let(:key){'saru'}

      it_behaves_like :zoukan_validation, [{:days => [0, 7], :expected_value => "己"},
                                           {:days => [8, 14], :expected_value => "壬"},
                                           {:days => [15, 30], :expected_value => "庚"}]
    end


    describe "酉" do
      let(:key){'tori'}

      it_behaves_like :zoukan_validation, [{:days => [0, 10], :expected_value => "庚"},
                                           {:days => [11, 30], :expected_value => "辛"}]
    end

    describe "戌" do
      let(:key){'inu'}

      it_behaves_like :zoukan_validation, [{:days => [0, 9], :expected_value => "辛"},
                                           {:days => [10, 12], :expected_value => "丁"},
                                           {:days => [13, 30], :expected_value => "戊"}]
    end

    describe "亥" do
      let(:key){'i'}

      it_behaves_like :zoukan_validation, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "甲"},
                                           {:days => [15, 30], :expected_value => "壬"}]
    end
  end

  describe Junishi, "天徳取得" do

    shared_examples_for :tentoku_validation do |params|
      params.each do |param|
        let(:key){param[:key]}
        it "#{param[:key]}_0" do
          subject.tentoku[0].name.should == param[:expected_value][0]
        end
        it "#{param[:key]}_1" do
          subject.tentoku[1].name.should == param[:expected_value][1]
        end
      end
    end

    it_behaves_like :tentoku_validation, [{:key => 'ne', :expected_value => ["巳", "申"]}]
    it_behaves_like :tentoku_validation, [{:key => 'usi', :expected_value => ["庚", "乙"]}]
    it_behaves_like :tentoku_validation, [{:key => 'tora', :expected_value => ["丁", "壬"]}]
    it_behaves_like :tentoku_validation, [{:key => 'u', :expected_value => ["申", "巳"]}]
    it_behaves_like :tentoku_validation, [{:key => 'tatsu', :expected_value => ["壬", "丁"]}]
    it_behaves_like :tentoku_validation, [{:key => 'mi', :expected_value => ["辛", "丙"]}]
    it_behaves_like :tentoku_validation, [{:key => 'uma', :expected_value => ["亥", "寅"]}]
    it_behaves_like :tentoku_validation, [{:key => 'hitsuji', :expected_value => ["甲", "己"]}]
    it_behaves_like :tentoku_validation, [{:key => 'saru', :expected_value => ["癸", "戊"]}]
    it_behaves_like :tentoku_validation, [{:key => 'tori', :expected_value => ["寅", "亥"]}]
    it_behaves_like :tentoku_validation, [{:key => 'inu', :expected_value => ["丙", "辛"]}]
    it_behaves_like :tentoku_validation, [{:key => 'i', :expected_value => ["乙", "庚"]}]
  end

  describe Junishi, "五行取得" do

    shared_examples_for :gogyo_validation do |params|
      params.each do |param|
        param[:days].each do |day|
          param[:expected_values].each_with_index do |expected_value, index|
            it{ subject.gogyo(day)[index].code.should == expected_value }
          end
        end
      end
    end

    describe "子" do
      let(:key){'ne'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [4]}]
    end

    describe "丑" do
      let(:key){'usi'}

      it_behaves_like :gogyo_validation, [{:days => [0, 12], :expected_values => [4,2]} ,
                                          {:days => [13, 30], :expected_values => [4,2]}]
    end

    describe "寅" do
      let(:key){'tora'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [0]}]
    end

    describe "卯" do
      let(:key){'u'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [0]}]
    end

    describe "辰" do
      let(:key){'tatsu'}

      it_behaves_like :gogyo_validation, [{:days => [0, 12], :expected_values => [0,2]} ,
                                          {:days => [13, 30], :expected_values => [0,2]}]
    end

    describe "巳" do
      let(:key){'mi'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [1]}]
    end

    describe "午" do
      let(:key){'uma'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [1]}]
    end

    describe "未" do
      let(:key){'hitsuji'}

      it_behaves_like :gogyo_validation, [{:days => [0, 12], :expected_values => [1,2]} ,
                                          {:days => [13, 30], :expected_values => [1,2]}]
    end

    describe "申" do
      let(:key){'saru'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [3]}]
    end


    describe "酉" do
      let(:key){'tori'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [3]}]
    end

    describe "戌" do
      let(:key){'inu'}

      it_behaves_like :gogyo_validation, [{:days => [0, 12], :expected_values => [3,2]} ,
                                          {:days => [13, 30], :expected_values => [3,2]}]
    end

    describe "亥" do
      let(:key){'i'}

      it_behaves_like :gogyo_validation, [{:days => [0, 30], :expected_values => [4]}]
    end
  end

  describe Junishi, "関連" do

    describe Junishi, "支合" do
      describe "check" do
        shared_examples_for :shigou_check_validation do |params|
          subject{Junishi.by_key(key).gou?(relation)}
          it_behaves_like :relation_check_validation_junishi, params
        end

        check_test_patterns = [{:key => 'ne', :relation_value => 'usi', :expected_value => false},
                               {:key => 'usi', :relation_value => 'ne', :expected_value => false},
                               {:key => 'tora', :relation_value => 'i', :expected_value => true},
                               {:key => 'u', :relation_value => 'inu', :expected_value => true},
                               {:key => 'tatsu', :relation_value => 'tori', :expected_value => true},
                               {:key => 'mi', :relation_value => 'saru', :expected_value => true},
                               {:key => 'uma', :relation_value => 'hitsuji', :expected_value => false},
                               {:key => 'hitsuji', :relation_value => 'uma', :expected_value => false},
                               {:key => 'saru', :relation_value => 'mi', :expected_value => true},
                               {:key => 'tori', :relation_value => 'tatsu', :expected_value => true},
                               {:key => 'inu', :relation_value => 'u', :expected_value => true},
                               {:key => 'i', :relation_value => 'tora', :expected_value => true}]

        check_test_patterns.each do |pattern|
          it_behaves_like :shigou_check_validation, pattern
        end
      end

      describe "get" do
        shared_examples_for :shigou_get_validation do |params|
          subject{Junishi.by_key(key).gou}
          it_behaves_like :relation_get_validation_junishi, params
        end

        get_test_patterns = [{:key => 'ne', :relation_value => nil},
                             {:key => 'usi', :relation_value => nil},
                             {:key => 'tora', :relation_value => 'i'},
                             {:key => 'u', :relation_value => 'inu'},
                             {:key => 'tatsu', :relation_value => 'tori'},
                             {:key => 'mi', :relation_value => 'saru'},
                             {:key => 'uma', :relation_value => nil},
                             {:key => 'hitsuji', :relation_value => nil},
                             {:key => 'saru', :relation_value => 'mi'},
                             {:key => 'tori', :relation_value => 'tatsu'},
                             {:key => 'inu', :relation_value => 'u'},
                             {:key => 'i', :relation_value => 'tora'}]

        get_test_patterns.each do |pattern|
          it_behaves_like :shigou_get_validation, pattern
        end
      end
    end

    describe Junishi, "刑" do
      shared_examples_for :kei_check_validation do |params|
        subject{Junishi.by_key(key).kei?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :kei_get_validation do |params|
        subject{Junishi.by_key(key).kei}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'u', :expected_value => true},
                      {:key => 'usi', :relation_value => 'inu', :expected_value => true},
                      {:key => 'tora', :relation_value => 'mi', :expected_value => true},
                      {:key => 'u', :relation_value => 'ne', :expected_value => true},
                      {:key => 'tatsu', :relation_value => 'tatsu', :expected_value => true},
                      {:key => 'mi', :relation_value => 'saru', :expected_value => true},
                      {:key => 'uma', :relation_value => 'uma', :expected_value => true},
                      {:key => 'hitsuji', :relation_value => 'usi', :expected_value => true},
                      {:key => 'saru', :relation_value => 'tora', :expected_value => true},
                      {:key => 'tori', :relation_value => 'tori', :expected_value => true},
                      {:key => 'inu', :relation_value => 'hitsuji', :expected_value => true},
                      {:key => 'i', :relation_value => 'i', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :kei_check_validation, pattern
        it_behaves_like :kei_get_validation, pattern
      end
    end

    describe Junishi, "冲" do
      shared_examples_for :chu_check_validation do |params|
        subject{Junishi.by_key(key).chu?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :chu_get_validation do |params|
        subject{Junishi.by_key(key).chu}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'uma', :expected_value => true},
                       {:key => 'usi', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'tora', :relation_value => 'saru', :expected_value => true},
                       {:key => 'u', :relation_value => 'tori', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'inu', :expected_value => true},
                       {:key => 'mi', :relation_value => 'i', :expected_value => true},
                       {:key => 'uma', :relation_value => 'ne', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'usi', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tora', :expected_value => true},
                       {:key => 'tori', :relation_value => 'u', :expected_value => true},
                       {:key => 'inu', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'i', :relation_value => 'mi', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :chu_check_validation, pattern
        it_behaves_like :chu_get_validation, pattern
      end
    end

    describe Junishi, "破" do
      shared_examples_for :ha_check_validation do |params|
        subject{Junishi.by_key(key).ha?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :ha_get_validation do |params|
        subject{Junishi.by_key(key).ha}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tori', :expected_value => true},
                       {:key => 'usi', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tora', :relation_value => 'i', :expected_value => true},
                       {:key => 'u', :relation_value => 'uma', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'usi', :expected_value => true},
                       {:key => 'mi', :relation_value => 'saru', :expected_value => true},
                       {:key => 'uma', :relation_value => 'u', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'inu', :expected_value => true},
                       {:key => 'saru', :relation_value => 'mi', :expected_value => true},
                       {:key => 'tori', :relation_value => 'ne', :expected_value => true},
                       {:key => 'inu', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'i', :relation_value => 'tora', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :ha_check_validation, pattern
        it_behaves_like :ha_get_validation, pattern
      end
    end

    describe Junishi, "害" do
      shared_examples_for :gai_check_validation do |params|
        subject{Junishi.by_key(key).gai?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :gai_get_validation do |params|
        subject{Junishi.by_key(key).gai}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'usi', :relation_value => 'uma', :expected_value => true},
                       {:key => 'tora', :relation_value => 'mi', :expected_value => true},
                       {:key => 'u', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'u', :expected_value => true},
                       {:key => 'mi', :relation_value => 'tora', :expected_value => true},
                       {:key => 'uma', :relation_value => 'usi', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'ne', :expected_value => true},
                       {:key => 'saru', :relation_value => 'i', :expected_value => true},
                       {:key => 'tori', :relation_value => 'inu', :expected_value => true},
                       {:key => 'inu', :relation_value => 'tori', :expected_value => true},
                       {:key => 'i', :relation_value => 'saru', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :gai_check_validation, pattern
        it_behaves_like :gai_get_validation, pattern
      end
    end

    describe Junishi, "華蓋" do
      shared_examples_for :kagai_check_validation do |params|
        subject{Junishi.by_key(key).kagai?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :kagai_get_validation do |params|
        subject{Junishi.by_key(key).kagai}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'usi', :relation_value => 'usi', :expected_value => true},
                       {:key => 'tora', :relation_value => 'inu', :expected_value => true},
                       {:key => 'u', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'mi', :relation_value => 'usi', :expected_value => true},
                       {:key => 'uma', :relation_value => 'inu', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tori', :relation_value => 'usi', :expected_value => true},
                       {:key => 'inu', :relation_value => 'inu', :expected_value => true},
                       {:key => 'i', :relation_value => 'hitsuji', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :kagai_check_validation, pattern
        it_behaves_like :kagai_get_validation, pattern
      end
    end

    describe Junishi, "天耗" do
      shared_examples_for :tenmou_check_validation do |params|
        subject{Junishi.by_key(key).tenmou?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :tenmou_get_validation do |params|
        subject{Junishi.by_key(key).tenmou}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'saru', :expected_value => true},
                       {:key => 'usi', :relation_value => 'inu', :expected_value => true},
                       {:key => 'tora', :relation_value => 'ne', :expected_value => true},
                       {:key => 'u', :relation_value => 'tora', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'mi', :relation_value => 'uma', :expected_value => true},
                       {:key => 'uma', :relation_value => 'saru', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'inu', :expected_value => true},
                       {:key => 'saru', :relation_value => 'ne', :expected_value => true},
                       {:key => 'tori', :relation_value => 'tora', :expected_value => true},
                       {:key => 'inu', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'i', :relation_value => 'uma', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :tenmou_check_validation, pattern
        it_behaves_like :tenmou_get_validation, pattern
      end
    end

    describe Junishi, "地耗" do
      shared_examples_for :chimou_check_validation do |params|
        subject{Junishi.by_key(key).chimou?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :chimou_get_validation do |params|
        subject{Junishi.by_key(key).chimou}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'mi', :expected_value => true},
                       {:key => 'usi', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'tora', :relation_value => 'tori', :expected_value => true},
                       {:key => 'u', :relation_value => 'i', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'usi', :expected_value => true},
                       {:key => 'mi', :relation_value => 'u', :expected_value => true},
                       {:key => 'uma', :relation_value => 'mi', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tori', :expected_value => true},
                       {:key => 'tori', :relation_value => 'i', :expected_value => true},
                       {:key => 'inu', :relation_value => 'usi', :expected_value => true},
                       {:key => 'i', :relation_value => 'u', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :chimou_check_validation, pattern
        it_behaves_like :chimou_get_validation, pattern
      end
    end

    describe Junishi, "白衣" do
      shared_examples_for :byakui_check_validation do |params|
        subject{Junishi.by_key(key).byakui?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :byakui_get_validation do |params|
        subject{Junishi.by_key(key).byakui}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tori', :expected_value => true},
                       {:key => 'usi', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tora', :relation_value => 'mi', :expected_value => true},
                       {:key => 'u', :relation_value => 'ne', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'usi', :expected_value => true},
                       {:key => 'mi', :relation_value => 'saru', :expected_value => true},
                       {:key => 'uma', :relation_value => 'u', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'inu', :expected_value => true},
                       {:key => 'saru', :relation_value => 'i', :expected_value => true},
                       {:key => 'tori', :relation_value => 'uma', :expected_value => true},
                       {:key => 'inu', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'i', :relation_value => 'tora', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :byakui_check_validation, pattern
        it_behaves_like :byakui_get_validation, pattern
      end
    end

    describe Junishi, "断橋" do
      shared_examples_for :dankyo_check_validation do |params|
        subject{Junishi.by_key(key).dankyo?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :dankyo_get_validation do |params|
        subject{Junishi.by_key(key).dankyo}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'ne', :expected_value => true},
                       {:key => 'usi', :relation_value => 'i', :expected_value => true},
                       {:key => 'tora', :relation_value => 'tora', :expected_value => true},
                       {:key => 'u', :relation_value => 'u', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'saru', :expected_value => true},
                       {:key => 'mi', :relation_value => 'usi', :expected_value => true},
                       {:key => 'uma', :relation_value => 'inu', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'tori', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tori', :relation_value => 'mi', :expected_value => true},
                       {:key => 'inu', :relation_value => 'uma', :expected_value => true},
                       {:key => 'i', :relation_value => 'hitsuji', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :dankyo_check_validation, pattern
        it_behaves_like :dankyo_get_validation, pattern
      end
    end

    describe Junishi, "血支" do
      shared_examples_for :kessi_check_validation do |params|
        subject{Junishi.by_key(key).kessi?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :kessi_get_validation do |params|
        subject{Junishi.by_key(key).kessi}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'saru', :expected_value => true},
                       {:key => 'usi', :relation_value => 'tori', :expected_value => true},
                       {:key => 'tora', :relation_value => 'inu', :expected_value => true},
                       {:key => 'u', :relation_value => 'i', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'ne', :expected_value => true},
                       {:key => 'mi', :relation_value => 'usi', :expected_value => true},
                       {:key => 'uma', :relation_value => 'tora', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'u', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'tori', :relation_value => 'mi', :expected_value => true},
                       {:key => 'inu', :relation_value => 'uma', :expected_value => true},
                       {:key => 'i', :relation_value => 'hitsuji', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :kessi_check_validation, pattern
        it_behaves_like :kessi_get_validation, pattern
      end
    end

    describe Junishi, "天徳貴人" do

      shared_examples_for :tentoku_kijin_get_validation_junishi do |params|
        subject{Junishi.by_key(key).tentoku_kijin}
        it_behaves_like :relation_get_validation_junishi, params
      end

      shared_examples_for :tentoku_kijin_get_validation_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_kijin}
        it_behaves_like :relation_get_validation_jikkan, params
      end

      shared_examples_for :tentoku_kijin_check_validation_junishi do |params|
        subject{Junishi.by_key(key).tentoku_kijin?(relation)}
        it_behaves_like :relation_check_validation_pillar_junishi, params
      end

      shared_examples_for :tentoku_kijin_check_validation_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_kijin?(relation)}
        it_behaves_like :relation_check_validation_pillar_jikkan, params
      end

      test_patterns_junishi = [{:key => 'ne', :relation_value => 'mi', :expected_value => true},
                       {:key => 'u', :relation_value => 'saru', :expected_value => true},
                       {:key => 'uma', :relation_value => 'i', :expected_value => true},
                       {:key => 'tori', :relation_value => 'tora', :expected_value => true}]

      test_patterns_junishi.each do |pattern|
         it_behaves_like :tentoku_kijin_get_validation_junishi, pattern
         it_behaves_like :tentoku_kijin_check_validation_junishi, pattern
       end

      test_patterns_jikkan = [{:key => 'usi', :relation_value => 'kanoe', :expected_value => true},
                               {:key => 'tora', :relation_value => 'hinoto', :expected_value => true},
                               {:key => 'tatsu', :relation_value => 'mizunoe', :expected_value => true},
                               {:key => 'mi', :relation_value => 'kanoto', :expected_value => true},
                               {:key => 'hitsuji', :relation_value => 'kinoe', :expected_value => true},
                               {:key => 'saru', :relation_value => 'mizunoto', :expected_value => true},
                               {:key => 'inu', :relation_value => 'hinoe', :expected_value => true},
                               {:key => 'i', :relation_value => 'kinoto', :expected_value => true}]

      test_patterns_jikkan.each do |pattern|
        it_behaves_like :tentoku_kijin_get_validation_jikkan, pattern
        it_behaves_like :tentoku_kijin_check_validation_jikkan, pattern
      end
    end

    describe Junishi, "天徳合" do

      shared_examples_for :tentoku_gou_get_validation_junishi do |params|
        subject{Junishi.by_key(key).tentoku_gou}
        it_behaves_like :relation_get_validation_junishi, params
      end

      shared_examples_for :tentoku_gou_get_validation_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_gou}
        it_behaves_like :relation_get_validation_jikkan, params
      end

      shared_examples_for :tentoku_gou_check_validation_junishi do |params|
        subject{Junishi.by_key(key).tentoku_gou?(relation)}
        it_behaves_like :relation_check_validation_pillar_junishi, params
      end

      shared_examples_for :tentoku_gou_check_validation_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_gou?(relation)}
        it_behaves_like :relation_check_validation_pillar_jikkan, params
      end

      test_patterns_junishi = [{:key => 'ne', :relation_value => 'saru', :expected_value => true},
                               {:key => 'u', :relation_value => 'mi', :expected_value => true},
                               {:key => 'uma', :relation_value => 'tora', :expected_value => true},
                               {:key => 'tori', :relation_value => 'i', :expected_value => true}]

      test_patterns_jikkan = [{:key => 'usi', :relation_value => 'kinoto', :expected_value => true},
                              {:key => 'tora', :relation_value => 'mizunoe', :expected_value => true},
                              {:key => 'tatsu', :relation_value => 'hinoto', :expected_value => true},
                              {:key => 'mi', :relation_value => 'hinoe', :expected_value => true},
                              {:key => 'hitsuji', :relation_value => 'tsuchinoto', :expected_value => true},
                              {:key => 'saru', :relation_value => 'tsuchinoe', :expected_value => true},
                              {:key => 'inu', :relation_value => 'kanoto', :expected_value => true},
                              {:key => 'i', :relation_value => 'kanoe', :expected_value => true}]

      test_patterns_junishi.each do |pattern|
        it_behaves_like :tentoku_gou_get_validation_junishi, pattern
        it_behaves_like :tentoku_gou_check_validation_junishi, pattern
      end

      test_patterns_jikkan.each do |pattern|
        it_behaves_like :tentoku_gou_get_validation_jikkan, pattern
        it_behaves_like :tentoku_gou_check_validation_jikkan, pattern
      end

    end

    describe Junishi, "月徳貴人" do
      shared_examples_for :gettoku_kijin_get_validation do |params|
        subject{Junishi.by_key(key).gettoku_kijin}
        it_behaves_like :relation_get_validation_jikkan, params
      end

      shared_examples_for :gettoku_kijin_check_validation do |params|
        subject{Junishi.by_key(key).gettoku_kijin?(relation)}
        it_behaves_like :relation_check_validation_jikkan, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'usi', :relation_value => 'kanoe', :expected_value => true},
                       {:key => 'tora', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'u', :relation_value => 'kinoe', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'mi', :relation_value => 'kanoe', :expected_value => true},
                       {:key => 'uma', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'kinoe', :expected_value => true},
                       {:key => 'saru', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'tori', :relation_value => 'kanoe', :expected_value => true},
                       {:key => 'inu', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'i', :relation_value => 'kinoe', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :gettoku_kijin_check_validation, pattern
        it_behaves_like :gettoku_kijin_get_validation, pattern
      end
    end

    describe Junishi, "月徳合" do
      shared_examples_for :gettoku_gou_get_validation do |params|
        subject{Junishi.by_key(key).gettoku_gou}
        it_behaves_like :relation_get_validation_jikkan, params
      end

      shared_examples_for :gettoku_gou_check_validation do |params|
        subject{Junishi.by_key(key).gettoku_gou?(relation)}
        it_behaves_like :relation_check_validation_jikkan, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'hinoto', :expected_value => true},
                       {:key => 'usi', :relation_value => 'kinoto', :expected_value => true},
                       {:key => 'tora', :relation_value => 'kanoto', :expected_value => true},
                       {:key => 'u', :relation_value => 'tsuchinoto', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'hinoto', :expected_value => true},
                       {:key => 'mi', :relation_value => 'kinoto', :expected_value => true},
                       {:key => 'uma', :relation_value => 'kanoto', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'tsuchinoto', :expected_value => true},
                       {:key => 'saru', :relation_value => 'hinoto', :expected_value => true},
                       {:key => 'tori', :relation_value => 'kinoto', :expected_value => true},
                       {:key => 'inu', :relation_value => 'kanoto', :expected_value => true},
                       {:key => 'i', :relation_value => 'tsuchinoto', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :gettoku_gou_check_validation, pattern
        it_behaves_like :gettoku_gou_get_validation, pattern
      end

    end

    describe Junishi, "月空" do
      shared_examples_for :gekku_get_validation do |params|
        subject{Junishi.by_key(key).gekku}
        it_behaves_like :relation_get_validation_jikkan, params
      end

      shared_examples_for :gekku_check_validation do |params|
        subject{Junishi.by_key(key).gekku?(relation)}
        it_behaves_like :relation_check_validation_jikkan, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'usi', :relation_value => 'kinoe', :expected_value => true},
                       {:key => 'tora', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'u', :relation_value => 'kanoe', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'mi', :relation_value => 'kinoe', :expected_value => true},
                       {:key => 'uma', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'kanoe', :expected_value => true},
                       {:key => 'saru', :relation_value => 'hinoe', :expected_value => true},
                       {:key => 'tori', :relation_value => 'kinoe', :expected_value => true},
                       {:key => 'inu', :relation_value => 'mizunoe', :expected_value => true},
                       {:key => 'i', :relation_value => 'kanoe', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :gekku_check_validation, pattern
        it_behaves_like :gekku_get_validation, pattern
      end
    end

    describe Junishi, "駅馬" do
      shared_examples_for :ekiba_check_validation do |params|
        subject{Junishi.by_key(key).ekiba?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :ekiba_get_validation do |params|
        subject{Junishi.by_key(key).ekiba}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tora', :expected_value => true},
                       {:key => 'usi', :relation_value => 'i', :expected_value => true},
                       {:key => 'tora', :relation_value => 'saru', :expected_value => true},
                       {:key => 'u', :relation_value => 'mi', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'tora', :expected_value => true},
                       {:key => 'mi', :relation_value => 'i', :expected_value => true},
                       {:key => 'uma', :relation_value => 'saru', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'mi', :expected_value => true},
                       {:key => 'saru', :relation_value => 'tora', :expected_value => true},
                       {:key => 'tori', :relation_value => 'i', :expected_value => true},
                       {:key => 'inu', :relation_value => 'saru', :expected_value => true},
                       {:key => 'i', :relation_value => 'mi', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :ekiba_check_validation, pattern
        it_behaves_like :ekiba_get_validation, pattern
      end
    end

    describe Junishi, "生成馬" do
      shared_examples_for :seiseiba_check_validation do |params|
        subject{Junishi.by_key(key).seiseiba?(relation)}
        it_behaves_like :relation_check_validation_pillar,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'kinoe', :chishi => 'tora', :expected_value => true},
                       {:key => 'usi', :tenkan => 'kanoto', :chishi => 'i', :expected_value => true},
                       {:key => 'tora', :tenkan => 'kanoe', :chishi => 'saru', :expected_value => true},
                       {:key => 'u', :tenkan => 'hinoto', :chishi => 'mi', :expected_value => true},
                       {:key => 'tatsu', :tenkan => 'kinoe', :chishi => 'tora', :expected_value => true},
                       {:key => 'mi', :tenkan => 'kanoto', :chishi => 'i', :expected_value => true},
                       {:key => 'uma', :tenkan => 'kanoe', :chishi => 'saru', :expected_value => true},
                       {:key => 'hitsuji', :tenkan => 'hinoto', :chishi => 'mi', :expected_value => true},
                       {:key => 'saru', :tenkan => 'kinoe', :chishi => 'tora', :expected_value => true},
                       {:key => 'tori', :tenkan => 'kanoto', :chishi => 'i', :expected_value => true},
                       {:key => 'inu', :tenkan => 'kanoe', :chishi => 'saru', :expected_value => true},
                       {:key => 'i', :tenkan => 'hinoto', :chishi => 'mi', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :seiseiba_check_validation, pattern
      end
    end

    describe Junishi, "喪門" do
      shared_examples_for :momon_check_validation do |params|
        subject{Junishi.by_key(key).momon?(relation)}
        it_behaves_like :relation_check_validation_junishi, params
      end

      shared_examples_for :momon_get_validation do |params|
        subject{Junishi.by_key(key).momon}
        it_behaves_like :relation_get_validation_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tora', :expected_value => true},
                       {:key => 'usi', :relation_value => 'u', :expected_value => true},
                       {:key => 'tora', :relation_value => 'tatsu', :expected_value => true},
                       {:key => 'u', :relation_value => 'mi', :expected_value => true},
                       {:key => 'tatsu', :relation_value => 'uma', :expected_value => true},
                       {:key => 'mi', :relation_value => 'hitsuji', :expected_value => true},
                       {:key => 'uma', :relation_value => 'saru', :expected_value => true},
                       {:key => 'hitsuji', :relation_value => 'tori', :expected_value => true},
                       {:key => 'saru', :relation_value => 'inu', :expected_value => true},
                       {:key => 'tori', :relation_value => 'i', :expected_value => true},
                       {:key => 'inu', :relation_value => 'ne', :expected_value => true},
                       {:key => 'i', :relation_value => 'usi', :expected_value => true}]

      test_patterns.each do |pattern|
        it_behaves_like :momon_check_validation, pattern
        it_behaves_like :momon_get_validation, pattern
      end

    end

  end
end
