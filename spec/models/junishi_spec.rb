# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'

describe Junishi, "十二支のテスト" do
  subject{Junishi.by_key(key)}

  describe Junishi, "蔵干取得" do

    shared_examples_for :zoukan_test do |params|
      params.each do |param|
        param[:days].each do |day|
          it{ subject.zoukan(day).name.should == param[:expected_value] }
        end
      end
    end

    describe "子" do
      let(:key){'ne'}

      it_behaves_like :zoukan_test, [{:days => [0, 10], :expected_value => "壬"},
                                           {:days => [11, 30], :expected_value => "癸"}]
    end

    describe "丑" do
      let(:key){'usi'}

      it_behaves_like :zoukan_test, [{:days => [0, 9], :expected_value => "癸"} ,
                                           {:days => [10, 12], :expected_value => "辛"} ,
                                           {:days => [13, 30], :expected_value => "己"}]
    end

    describe "寅" do
      let(:key){'tora'}

      it_behaves_like :zoukan_test, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "丙"},
                                           {:days => [15, 30], :expected_value => "甲"}]
    end

    describe "卯" do
      let(:key){'u'}

      it_behaves_like :zoukan_test, [{:days => [0, 10], :expected_value => "甲"},
                                           {:days => [11, 30], :expected_value => "乙"}]
    end

    describe "辰" do
      let(:key){'tatsu'}

      it_behaves_like :zoukan_test, [{:days => [0, 9], :expected_value => "乙"},
                                           {:days => [10, 12], :expected_value => "癸"},
                                           {:days => [13, 30], :expected_value => "戊"}]
    end

    describe "巳" do
      let(:key){'mi'}

      it_behaves_like :zoukan_test, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "庚"},
                                           {:days => [15, 30], :expected_value => "丙"}]
    end

    describe "午" do
      let(:key){'uma'}

      it_behaves_like :zoukan_test, [{:days => [0, 10], :expected_value => "丙"},
                                           {:days => [11, 17], :expected_value => "己"},
                                           {:days => [18, 30], :expected_value => "丁"}]
    end

    describe "未" do
      let(:key){'hitsuji'}

      it_behaves_like :zoukan_test, [{:days => [0, 9], :expected_value => "丁"},
                                           {:days => [10, 12], :expected_value => "乙"},
                                           {:days => [13, 30], :expected_value => "己"}]
    end

    describe "申" do
      let(:key){'saru'}

      it_behaves_like :zoukan_test, [{:days => [0, 7], :expected_value => "己"},
                                           {:days => [8, 14], :expected_value => "壬"},
                                           {:days => [15, 30], :expected_value => "庚"}]
    end


    describe "酉" do
      let(:key){'tori'}

      it_behaves_like :zoukan_test, [{:days => [0, 10], :expected_value => "庚"},
                                           {:days => [11, 30], :expected_value => "辛"}]
    end

    describe "戌" do
      let(:key){'inu'}

      it_behaves_like :zoukan_test, [{:days => [0, 9], :expected_value => "辛"},
                                           {:days => [10, 12], :expected_value => "丁"},
                                           {:days => [13, 30], :expected_value => "戊"}]
    end

    describe "亥" do
      let(:key){'i'}

      it_behaves_like :zoukan_test, [{:days => [0, 7], :expected_value => "戊"},
                                           {:days => [8, 14], :expected_value => "甲"},
                                           {:days => [15, 30], :expected_value => "壬"}]
    end
  end

  describe Junishi, "天徳取得" do

    shared_examples_for :tentoku_test do |params|
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

    it_behaves_like :tentoku_test, [{:key => 'ne', :expected_value => ["巳", "申"]}]
    it_behaves_like :tentoku_test, [{:key => 'usi', :expected_value => ["庚", "乙"]}]
    it_behaves_like :tentoku_test, [{:key => 'tora', :expected_value => ["丁", "壬"]}]
    it_behaves_like :tentoku_test, [{:key => 'u', :expected_value => ["申", "巳"]}]
    it_behaves_like :tentoku_test, [{:key => 'tatsu', :expected_value => ["壬", "丁"]}]
    it_behaves_like :tentoku_test, [{:key => 'mi', :expected_value => ["辛", "丙"]}]
    it_behaves_like :tentoku_test, [{:key => 'uma', :expected_value => ["亥", "寅"]}]
    it_behaves_like :tentoku_test, [{:key => 'hitsuji', :expected_value => ["甲", "己"]}]
    it_behaves_like :tentoku_test, [{:key => 'saru', :expected_value => ["癸", "戊"]}]
    it_behaves_like :tentoku_test, [{:key => 'tori', :expected_value => ["寅", "亥"]}]
    it_behaves_like :tentoku_test, [{:key => 'inu', :expected_value => ["丙", "辛"]}]
    it_behaves_like :tentoku_test, [{:key => 'i', :expected_value => ["乙", "庚"]}]
  end

  describe Junishi, "五行取得" do

    shared_examples_for :gogyo_test do |params|
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

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [4]}]
    end

    describe "丑" do
      let(:key){'usi'}

      it_behaves_like :gogyo_test, [{:days => [0, 12], :expected_values => [4,2]} ,
                                          {:days => [13, 30], :expected_values => [4,2]}]
    end

    describe "寅" do
      let(:key){'tora'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [0]}]
    end

    describe "卯" do
      let(:key){'u'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [0]}]
    end

    describe "辰" do
      let(:key){'tatsu'}

      it_behaves_like :gogyo_test, [{:days => [0, 12], :expected_values => [0,2]} ,
                                          {:days => [13, 30], :expected_values => [0,2]}]
    end

    describe "巳" do
      let(:key){'mi'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [1]}]
    end

    describe "午" do
      let(:key){'uma'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [1]}]
    end

    describe "未" do
      let(:key){'hitsuji'}

      it_behaves_like :gogyo_test, [{:days => [0, 12], :expected_values => [1,2]} ,
                                          {:days => [13, 30], :expected_values => [1,2]}]
    end

    describe "申" do
      let(:key){'saru'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [3]}]
    end


    describe "酉" do
      let(:key){'tori'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [3]}]
    end

    describe "戌" do
      let(:key){'inu'}

      it_behaves_like :gogyo_test, [{:days => [0, 12], :expected_values => [3,2]} ,
                                          {:days => [13, 30], :expected_values => [3,2]}]
    end

    describe "亥" do
      let(:key){'i'}

      it_behaves_like :gogyo_test, [{:days => [0, 30], :expected_values => [4]}]
    end
  end

  describe Junishi, "関連" do

    describe Junishi, "支合" do
      describe "check" do
        shared_examples_for :shigou_check do |params|
          subject{Junishi.by_key(key).gou?(relation)}
          it_behaves_like :relation_check_for_junishi, params
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
          it_behaves_like :shigou_check, pattern
        end
      end

      describe "get" do
        shared_examples_for :shigou_get do |params|
          subject{Junishi.by_key(key).gou}
          it_behaves_like :relation_get_for_junishi, params
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
          it_behaves_like :shigou_get, pattern
        end
      end
    end

    describe Junishi, "刑" do
      shared_examples_for :kei_check do |params|
        subject{Junishi.by_key(key).kei?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :kei_get do |params|
        subject{Junishi.by_key(key).kei}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :kei_check, pattern
        it_behaves_like :kei_get, pattern
      end
    end

    describe Junishi, "冲" do
      shared_examples_for :chu_check do |params|
        subject{Junishi.by_key(key).chu?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :chu_get do |params|
        subject{Junishi.by_key(key).chu}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :chu_check, pattern
        it_behaves_like :chu_get, pattern
      end
    end

    describe Junishi, "破" do
      shared_examples_for :ha_check do |params|
        subject{Junishi.by_key(key).ha?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :ha_get do |params|
        subject{Junishi.by_key(key).ha}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :ha_check, pattern
        it_behaves_like :ha_get, pattern
      end
    end

    describe Junishi, "害" do
      shared_examples_for :gai_check do |params|
        subject{Junishi.by_key(key).gai?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :gai_get do |params|
        subject{Junishi.by_key(key).gai}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :gai_check, pattern
        it_behaves_like :gai_get, pattern
      end
    end

    describe Junishi, "華蓋" do
      shared_examples_for :kagai_check do |params|
        subject{Junishi.by_key(key).kagai?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :kagai_get do |params|
        subject{Junishi.by_key(key).kagai}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :kagai_check, pattern
        it_behaves_like :kagai_get, pattern
      end
    end

    describe Junishi, "天耗" do
      shared_examples_for :tenmou_check do |params|
        subject{Junishi.by_key(key).tenmou?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :tenmou_get do |params|
        subject{Junishi.by_key(key).tenmou}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :tenmou_check, pattern
        it_behaves_like :tenmou_get, pattern
      end
    end

    describe Junishi, "地耗" do
      shared_examples_for :chimou_check do |params|
        subject{Junishi.by_key(key).chimou?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :chimou_get do |params|
        subject{Junishi.by_key(key).chimou}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :chimou_check, pattern
        it_behaves_like :chimou_get, pattern
      end
    end

    describe Junishi, "白衣" do
      shared_examples_for :byakui_check do |params|
        subject{Junishi.by_key(key).byakui?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :byakui_get do |params|
        subject{Junishi.by_key(key).byakui}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :byakui_check, pattern
        it_behaves_like :byakui_get, pattern
      end
    end

    describe Junishi, "断橋" do
      shared_examples_for :dankyo_check do |params|
        subject{Junishi.by_key(key).dankyo?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :dankyo_get do |params|
        subject{Junishi.by_key(key).dankyo}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :dankyo_check, pattern
        it_behaves_like :dankyo_get, pattern
      end
    end

    describe Junishi, "血支" do
      shared_examples_for :kessi_check do |params|
        subject{Junishi.by_key(key).kessi?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :kessi_get do |params|
        subject{Junishi.by_key(key).kessi}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :kessi_check, pattern
        it_behaves_like :kessi_get, pattern
      end
    end

    describe Junishi, "天徳貴人" do

      shared_examples_for :tentoku_kijin_get_junishi do |params|
        subject{Junishi.by_key(key).tentoku_kijin}
        it_behaves_like :relation_get_for_junishi, params
      end

      shared_examples_for :tentoku_kijin_get_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_kijin}
        it_behaves_like :relation_get_for_jikkan, params
      end

      shared_examples_for :tentoku_kijin_check_junishi do |params|
        subject{Junishi.by_key(key).tentoku_kijin?(relation)}
        it_behaves_like :relation_check_for_pillar_by_junishi, params
      end

      shared_examples_for :tentoku_kijin_check_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_kijin?(relation)}
        it_behaves_like :relation_check_for_pillar_by_jikkan, params
      end

      test_patterns_junishi = [{:key => 'ne', :relation_value => 'mi', :expected_value => true},
                       {:key => 'u', :relation_value => 'saru', :expected_value => true},
                       {:key => 'uma', :relation_value => 'i', :expected_value => true},
                       {:key => 'tori', :relation_value => 'tora', :expected_value => true}]

      test_patterns_junishi.each do |pattern|
         it_behaves_like :tentoku_kijin_get_junishi, pattern
         it_behaves_like :tentoku_kijin_check_junishi, pattern
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
        it_behaves_like :tentoku_kijin_get_jikkan, pattern
        it_behaves_like :tentoku_kijin_check_jikkan, pattern
      end
    end

    describe Junishi, "天徳合" do

      shared_examples_for :tentoku_gou_get_junishi do |params|
        subject{Junishi.by_key(key).tentoku_gou}
        it_behaves_like :relation_get_for_junishi, params
      end

      shared_examples_for :tentoku_gou_get_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_gou}
        it_behaves_like :relation_get_for_jikkan, params
      end

      shared_examples_for :tentoku_gou_check_junishi do |params|
        subject{Junishi.by_key(key).tentoku_gou?(relation)}
        it_behaves_like :relation_check_for_pillar_by_junishi, params
      end

      shared_examples_for :tentoku_gou_check_jikkan do |params|
        subject{Junishi.by_key(key).tentoku_gou?(relation)}
        it_behaves_like :relation_check_for_pillar_by_jikkan, params
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
        it_behaves_like :tentoku_gou_get_junishi, pattern
        it_behaves_like :tentoku_gou_check_junishi, pattern
      end

      test_patterns_jikkan.each do |pattern|
        it_behaves_like :tentoku_gou_get_jikkan, pattern
        it_behaves_like :tentoku_gou_check_jikkan, pattern
      end

    end

    describe Junishi, "月徳貴人" do
      shared_examples_for :gettoku_kijin_get do |params|
        subject{Junishi.by_key(key).gettoku_kijin}
        it_behaves_like :relation_get_for_jikkan, params
      end

      shared_examples_for :gettoku_kijin_check do |params|
        subject{Junishi.by_key(key).gettoku_kijin?(relation)}
        it_behaves_like :relation_check_for_jikkan, params
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
        it_behaves_like :gettoku_kijin_check, pattern
        it_behaves_like :gettoku_kijin_get, pattern
      end
    end

    describe Junishi, "月徳合" do
      shared_examples_for :gettoku_gou_get do |params|
        subject{Junishi.by_key(key).gettoku_gou}
        it_behaves_like :relation_get_for_jikkan, params
      end

      shared_examples_for :gettoku_gou_check do |params|
        subject{Junishi.by_key(key).gettoku_gou?(relation)}
        it_behaves_like :relation_check_for_jikkan, params
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
        it_behaves_like :gettoku_gou_check, pattern
        it_behaves_like :gettoku_gou_get, pattern
      end

    end

    describe Junishi, "月空" do
      shared_examples_for :gekku_get do |params|
        subject{Junishi.by_key(key).gekku}
        it_behaves_like :relation_get_for_jikkan, params
      end

      shared_examples_for :gekku_check do |params|
        subject{Junishi.by_key(key).gekku?(relation)}
        it_behaves_like :relation_check_for_jikkan, params
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
        it_behaves_like :gekku_check, pattern
        it_behaves_like :gekku_get, pattern
      end
    end

    describe Junishi, "駅馬" do
      shared_examples_for :ekiba_check do |params|
        subject{Junishi.by_key(key).ekiba?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :ekiba_get do |params|
        subject{Junishi.by_key(key).ekiba}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :ekiba_check, pattern
        it_behaves_like :ekiba_get, pattern
      end
    end

    describe Junishi, "生成馬" do
      shared_examples_for :seiseiba_check do |params|
        subject{Junishi.by_key(key).seiseiba?(relation)}
        it_behaves_like :relation_check_for_pillar,
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
        it_behaves_like :seiseiba_check, pattern
      end
    end

    describe Junishi, "喪門" do
      shared_examples_for :momon_check do |params|
        subject{Junishi.by_key(key).momon?(relation)}
        it_behaves_like :relation_check_for_junishi, params
      end

      shared_examples_for :momon_get do |params|
        subject{Junishi.by_key(key).momon}
        it_behaves_like :relation_get_for_junishi, params
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
        it_behaves_like :momon_check, pattern
        it_behaves_like :momon_get, pattern
      end

    end

    describe Junishi, "進神" do
      describe Junishi, "干" do
        shared_examples_for :sinjin_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).sinjin_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :sinjin_kan_get do |params|
          subject{Junishi.by_key(key).sinjin_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'tsuchinoto'},
                         {:key => 'usi', :relation_value => 'tsuchinoto'},
                         {:key => 'tora', :relation_value => 'kinoe'},
                         {:key => 'u', :relation_value => 'kinoe'},
                         {:key => 'tatsu', :relation_value => 'kinoe'},
                         {:key => 'mi', :relation_value => 'kinoe'},
                         {:key => 'uma', :relation_value => 'kinoe'},
                         {:key => 'hitsuji', :relation_value => 'kinoe'},
                         {:key => 'saru', :relation_value => 'tsuchinoto'},
                         {:key => 'tori', :relation_value => 'tsuchinoto'},
                         {:key => 'inu', :relation_value => 'tsuchinoto'},
                         {:key => 'i', :relation_value => 'tsuchinoto'}]

        test_patterns.each do |pattern|
          it_behaves_like :sinjin_kan_check, pattern
          it_behaves_like :sinjin_kan_get, pattern
        end
      end

      describe Junishi, "支" do
        shared_examples_for :sinjin_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).sinjin_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :sinjin_shi_get do |params|
          subject{Junishi.by_key(key).sinjin_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'tori'},
                         {:key => 'usi', :relation_value => 'tori'},
                         {:key => 'tora', :relation_value => 'ne'},
                         {:key => 'u', :relation_value => 'ne'},
                         {:key => 'tatsu', :relation_value => 'ne'},
                         {:key => 'mi', :relation_value => 'uma'},
                         {:key => 'uma', :relation_value => 'uma'},
                         {:key => 'hitsuji', :relation_value => 'uma'},
                         {:key => 'saru', :relation_value => 'u'},
                         {:key => 'tori', :relation_value => 'u'},
                         {:key => 'inu', :relation_value => 'u'},
                         {:key => 'i', :relation_value => 'tori'}]

        test_patterns.each do |pattern|
          it_behaves_like :sinjin_shi_check, pattern
          it_behaves_like :sinjin_shi_get, pattern
        end
      end
    end

    describe Junishi, "天赦" do
      describe Junishi, "干" do
        shared_examples_for :tensha_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tensha_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :tensha_kan_get do |params|
          subject{Junishi.by_key(key).tensha_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'kinoe'},
                         {:key => 'usi', :relation_value => 'kinoe'},
                         {:key => 'tora', :relation_value => 'tsuchinoe'},
                         {:key => 'u', :relation_value => 'tsuchinoe'},
                         {:key => 'tatsu', :relation_value => 'tsuchinoe'},
                         {:key => 'mi', :relation_value => 'kinoe'},
                         {:key => 'uma', :relation_value => 'kinoe'},
                         {:key => 'hitsuji', :relation_value => 'kinoe'},
                         {:key => 'saru', :relation_value => 'tsuchinoe'},
                         {:key => 'tori', :relation_value => 'tsuchinoe'},
                         {:key => 'inu', :relation_value => 'tsuchinoe'},
                         {:key => 'i', :relation_value => 'kinoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :tensha_kan_check, pattern
          it_behaves_like :tensha_kan_get, pattern
        end
      end

      describe Junishi, "支" do
        shared_examples_for :tensha_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tensha_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :tensha_shi_get do |params|
          subject{Junishi.by_key(key).tensha_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'tora'},
                         {:key => 'u', :relation_value => 'tora'},
                         {:key => 'tatsu', :relation_value => 'tora'},
                         {:key => 'mi', :relation_value => 'uma'},
                         {:key => 'uma', :relation_value => 'uma'},
                         {:key => 'hitsuji', :relation_value => 'uma'},
                         {:key => 'saru', :relation_value => 'saru'},
                         {:key => 'tori', :relation_value => 'saru'},
                         {:key => 'inu', :relation_value => 'saru'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :tensha_shi_check, pattern
          it_behaves_like :tensha_shi_get, pattern
        end
      end
    end

    describe Junishi, "座敗" do
      describe "1つめ" do
        describe Junishi, "干" do
          shared_examples_for :zahai_1_kan_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_1_kan?(relation)}
            it_behaves_like :relation_check_for_jikkan, params
          end

          shared_examples_for :zahai_1_kan_get do |params|
            subject{Junishi.by_key(key).zahai_1_kan}
            it_behaves_like :relation_get_for_jikkan, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tsuchinoe'},
                           {:key => 'usi', :relation_value => 'tsuchinoe'},
                           {:key => 'tora', :relation_value => 'kinoe'},
                           {:key => 'u', :relation_value => 'kinoe'},
                           {:key => 'tatsu', :relation_value => 'kinoe'},
                           {:key => 'mi', :relation_value => 'kinoto'},
                           {:key => 'uma', :relation_value => 'kinoto'},
                           {:key => 'hitsuji', :relation_value => 'kinoto'},
                           {:key => 'saru', :relation_value => 'hinoto'},
                           {:key => 'tori', :relation_value => 'hinoto'},
                           {:key => 'inu', :relation_value => 'hinoto'},
                           {:key => 'i', :relation_value => 'tsuchinoe'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_1_kan_check, pattern
            it_behaves_like :zahai_1_kan_get, pattern
          end
        end

        describe Junishi, "支" do
          shared_examples_for :zahai_1_shi_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_1_shi?(relation)}
            it_behaves_like :relation_check_for_junishi, params
          end

          shared_examples_for :zahai_1_shi_get do |params|
            subject{Junishi.by_key(key).zahai_1_shi}
            it_behaves_like :relation_get_for_junishi, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                           {:key => 'usi', :relation_value => 'tora'},
                           {:key => 'tora', :relation_value => 'mi'},
                           {:key => 'u', :relation_value => 'mi'},
                           {:key => 'tatsu', :relation_value => 'mi'},
                           {:key => 'mi', :relation_value => 'tori'},
                           {:key => 'uma', :relation_value => 'tori'},
                           {:key => 'hitsuji', :relation_value => 'tori'},
                           {:key => 'saru', :relation_value => 'usi'},
                           {:key => 'tori', :relation_value => 'usi'},
                           {:key => 'inu', :relation_value => 'usi'},
                           {:key => 'i', :relation_value => 'tora'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_1_shi_check, pattern
            it_behaves_like :zahai_1_shi_get, pattern
          end
        end
      end

      describe "2つめ" do
        describe Junishi, "支" do
          shared_examples_for :zahai_2_shi_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_2_shi?(relation)}
            it_behaves_like :relation_check_for_junishi, params
          end

          shared_examples_for :zahai_2_shi_get do |params|
            subject{Junishi.by_key(key).zahai_2_shi}
            it_behaves_like :relation_get_for_junishi, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                           {:key => 'usi', :relation_value => 'tora'},
                           {:key => 'tora', :relation_value => 'saru'},
                           {:key => 'u', :relation_value => 'saru'},
                           {:key => 'tatsu', :relation_value => 'saru'},
                           {:key => 'mi', :relation_value => 'tori'},
                           {:key => 'uma', :relation_value => 'tori'},
                           {:key => 'hitsuji', :relation_value => 'tori'},
                           {:key => 'saru', :relation_value => 'usi'},
                           {:key => 'tori', :relation_value => 'usi'},
                           {:key => 'inu', :relation_value => 'usi'},
                           {:key => 'i', :relation_value => 'tora'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_2_shi_check, pattern
            it_behaves_like :zahai_2_shi_get, pattern
          end
        end
      end

      describe "3つめ" do
        describe Junishi, "干" do
          shared_examples_for :zahai_3_kan_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_3_kan?(relation)}
            it_behaves_like :relation_check_for_jikkan, params
          end

          shared_examples_for :zahai_3_kan_get do |params|
            subject{Junishi.by_key(key).zahai_3_kan}
            it_behaves_like :relation_get_for_jikkan, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tsuchinoe'},
                           {:key => 'usi', :relation_value => 'tsuchinoe'},
                           {:key => 'tora', :relation_value => 'kinoe'},
                           {:key => 'u', :relation_value => 'kinoe'},
                           {:key => 'tatsu', :relation_value => 'kinoe'},
                           {:key => 'mi', :relation_value => 'kanoto'},
                           {:key => 'uma', :relation_value => 'kanoto'},
                           {:key => 'hitsuji', :relation_value => 'kanoto'},
                           {:key => 'saru', :relation_value => 'mizunoto'},
                           {:key => 'tori', :relation_value => 'mizunoto'},
                           {:key => 'inu', :relation_value => 'mizunoto'},
                           {:key => 'i', :relation_value => 'tsuchinoe'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_3_kan_check, pattern
            it_behaves_like :zahai_3_kan_get, pattern
          end
        end

        describe Junishi, "支" do
          shared_examples_for :zahai_3_shi_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_3_shi?(relation)}
            it_behaves_like :relation_check_for_junishi, params
          end

          shared_examples_for :zahai_3_shi_get do |params|
            subject{Junishi.by_key(key).zahai_3_shi}
            it_behaves_like :relation_get_for_junishi, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                           {:key => 'usi', :relation_value => 'tora'},
                           {:key => 'tora', :relation_value => 'u'},
                           {:key => 'u', :relation_value => 'u'},
                           {:key => 'tatsu', :relation_value => 'u'},
                           {:key => 'mi', :relation_value => 'tori'},
                           {:key => 'uma', :relation_value => 'tori'},
                           {:key => 'hitsuji', :relation_value => 'tori'},
                           {:key => 'saru', :relation_value => 'hitsuji'},
                           {:key => 'tori', :relation_value => 'hitsuji'},
                           {:key => 'inu', :relation_value => 'hitsuji'},
                           {:key => 'i', :relation_value => 'tora'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_3_shi_check, pattern
            it_behaves_like :zahai_3_shi_get, pattern
          end
        end
      end

      describe "4つめ" do
        describe Junishi, "干" do
          shared_examples_for :zahai_4_kan_check do |params|
            params[:expected_value] = true

            subject{Junishi.by_key(key).zahai_4_kan?(relation)}
            it_behaves_like :relation_check_for_jikkan, params
          end

          shared_examples_for :zahai_4_kan_get do |params|
            subject{Junishi.by_key(key).zahai_4_kan}
            it_behaves_like :relation_get_for_jikkan, params
          end

          test_patterns = [{:key => 'ne', :relation_value => 'tsuchinoe'},
                           {:key => 'usi', :relation_value => 'tsuchinoe'},
                           {:key => 'tora', :relation_value => 'kinoto'},
                           {:key => 'u', :relation_value => 'kinoto'},
                           {:key => 'tatsu', :relation_value => 'kinoto'},
                           {:key => 'mi', :relation_value => 'kanoto'},
                           {:key => 'uma', :relation_value => 'kanoto'},
                           {:key => 'hitsuji', :relation_value => 'kanoto'},
                           {:key => 'saru', :relation_value => 'mizunoto'},
                           {:key => 'tori', :relation_value => 'mizunoto'},
                           {:key => 'inu', :relation_value => 'mizunoto'},
                           {:key => 'i', :relation_value => 'tsuchinoe'}]

          test_patterns.each do |pattern|
            it_behaves_like :zahai_4_kan_check, pattern
            it_behaves_like :zahai_4_kan_get, pattern
          end
        end
      end
    end

    describe Junishi, "天転" do
      describe Junishi, "干" do
        shared_examples_for :tenten_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tenten_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :tenten_kan_get do |params|
          subject{Junishi.by_key(key).tenten_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'mizunoe'},
                         {:key => 'usi', :relation_value => 'mizunoe'},
                         {:key => 'tora', :relation_value => 'kinoto'},
                         {:key => 'u', :relation_value => 'kinoto'},
                         {:key => 'tatsu', :relation_value => 'kinoto'},
                         {:key => 'mi', :relation_value => 'hinoe'},
                         {:key => 'uma', :relation_value => 'hinoe'},
                         {:key => 'hitsuji', :relation_value => 'hinoe'},
                         {:key => 'saru', :relation_value => 'kanoto'},
                         {:key => 'tori', :relation_value => 'kanoto'},
                         {:key => 'inu', :relation_value => 'kanoto'},
                         {:key => 'i', :relation_value => 'mizunoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :tenten_kan_check, pattern
          it_behaves_like :tenten_kan_get, pattern
        end
      end

      describe Junishi, "支" do
        shared_examples_for :tenten_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tenten_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :tenten_shi_get do |params|
          subject{Junishi.by_key(key).tenten_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'u'},
                         {:key => 'u', :relation_value => 'u'},
                         {:key => 'tatsu', :relation_value => 'u'},
                         {:key => 'mi', :relation_value => 'uma'},
                         {:key => 'uma', :relation_value => 'uma'},
                         {:key => 'hitsuji', :relation_value => 'uma'},
                         {:key => 'saru', :relation_value => 'tori'},
                         {:key => 'tori', :relation_value => 'tori'},
                         {:key => 'inu', :relation_value => 'tori'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :tenten_shi_check, pattern
          it_behaves_like :tenten_shi_get, pattern
        end
      end
    end

    describe Junishi, "地転" do
      describe Junishi, "干" do
        shared_examples_for :chiten_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).chiten_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :chiten_kan_get do |params|
          subject{Junishi.by_key(key).chiten_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'hinoe'},
                         {:key => 'usi', :relation_value => 'hinoe'},
                         {:key => 'tora', :relation_value => 'kanoto'},
                         {:key => 'u', :relation_value => 'kanoto'},
                         {:key => 'tatsu', :relation_value => 'kanoto'},
                         {:key => 'mi', :relation_value => 'tsuchinoe'},
                         {:key => 'uma', :relation_value => 'tsuchinoe'},
                         {:key => 'hitsuji', :relation_value => 'tsuchinoe'},
                         {:key => 'saru', :relation_value => 'mizunoto'},
                         {:key => 'tori', :relation_value => 'mizunoto'},
                         {:key => 'inu', :relation_value => 'mizunoto'},
                         {:key => 'i', :relation_value => 'hinoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :chiten_kan_check, pattern
          it_behaves_like :chiten_kan_get, pattern
        end
      end

      describe Junishi, "支" do
        shared_examples_for :chiten_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).chiten_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :chiten_shi_get do |params|
          subject{Junishi.by_key(key).chiten_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'u'},
                         {:key => 'u', :relation_value => 'u'},
                         {:key => 'tatsu', :relation_value => 'u'},
                         {:key => 'mi', :relation_value => 'uma'},
                         {:key => 'uma', :relation_value => 'uma'},
                         {:key => 'hitsuji', :relation_value => 'uma'},
                         {:key => 'saru', :relation_value => 'tori'},
                         {:key => 'tori', :relation_value => 'tori'},
                         {:key => 'inu', :relation_value => 'tori'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :chiten_shi_check, pattern
          it_behaves_like :chiten_shi_get, pattern
        end
      end
    end

    describe Junishi, "天殺" do
      describe Junishi, "干" do
        shared_examples_for :tensatsu_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tensatsu_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :tensatsu_kan_get do |params|
          subject{Junishi.by_key(key).tensatsu_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'kanoe'},
                         {:key => 'usi', :relation_value => 'kanoe'},
                         {:key => 'tora', :relation_value => 'mizunoto'},
                         {:key => 'u', :relation_value => 'mizunoto'},
                         {:key => 'tatsu', :relation_value => 'mizunoto'},
                         {:key => 'mi', :relation_value => 'hinoe'},
                         {:key => 'uma', :relation_value => 'hinoe'},
                         {:key => 'hitsuji', :relation_value => 'hinoe'},
                         {:key => 'saru', :relation_value => 'hinoto'},
                         {:key => 'tori', :relation_value => 'hinoto'},
                         {:key => 'inu', :relation_value => 'hinoto'},
                         {:key => 'i', :relation_value => 'kanoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :tensatsu_kan_check, pattern
          it_behaves_like :tensatsu_kan_get, pattern
        end
      end

      describe Junishi, "支" do
        shared_examples_for :tensatsu_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).tensatsu_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :tensatsu_shi_get do |params|
          subject{Junishi.by_key(key).tensatsu_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'u'},
                         {:key => 'u', :relation_value => 'u'},
                         {:key => 'tatsu', :relation_value => 'u'},
                         {:key => 'mi', :relation_value => 'uma'},
                         {:key => 'uma', :relation_value => 'uma'},
                         {:key => 'hitsuji', :relation_value => 'uma'},
                         {:key => 'saru', :relation_value => 'tori'},
                         {:key => 'tori', :relation_value => 'tori'},
                         {:key => 'inu', :relation_value => 'tori'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :tensatsu_shi_check, pattern
          it_behaves_like :tensatsu_shi_get, pattern
        end
      end
    end

    describe Junishi, "八風" do
      describe Junishi, "干" do
        shared_examples_for :happu_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).happu_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :happu_kan_get do |params|
          subject{Junishi.by_key(key).happu_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'kinoe'},
                         {:key => 'usi', :relation_value => 'kinoe'},
                         {:key => 'tora', :relation_value => 'hinoto'},
                         {:key => 'u', :relation_value => 'hinoto'},
                         {:key => 'tatsu', :relation_value => 'hinoto'},
                         {:key => 'mi', :relation_value => 'kinoe'},
                         {:key => 'uma', :relation_value => 'kinoe'},
                         {:key => 'hitsuji', :relation_value => 'kinoe'},
                         {:key => 'saru', :relation_value => 'hinoto'},
                         {:key => 'tori', :relation_value => 'hinoto'},
                         {:key => 'inu', :relation_value => 'hinoto'},
                         {:key => 'i', :relation_value => 'kinoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :happu_kan_check, pattern
          it_behaves_like :happu_kan_get, pattern
        end
      end

      describe Junishi, "支(1)" do
        shared_examples_for :happu_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).happu_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :happu_shi_1_get do |params|
          subject{Junishi.by_key(key).happu_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'inu'},
                         {:key => 'usi', :relation_value => 'inu'},
                         {:key => 'tora', :relation_value => 'usi'},
                         {:key => 'u', :relation_value => 'usi'},
                         {:key => 'tatsu', :relation_value => 'usi'},
                         {:key => 'mi', :relation_value => 'tatsu'},
                         {:key => 'uma', :relation_value => 'tatsu'},
                         {:key => 'hitsuji', :relation_value => 'tatsu'},
                         {:key => 'saru', :relation_value => 'hitsuji'},
                         {:key => 'tori', :relation_value => 'hitsuji'},
                         {:key => 'inu', :relation_value => 'hitsuji'},
                         {:key => 'i', :relation_value => 'inu'}]

        test_patterns.each do |pattern|
          it_behaves_like :happu_shi_1_check, pattern
          it_behaves_like :happu_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :happu_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).happu_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :happu_shi_2_get do |params|
          subject{Junishi.by_key(key).happu_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                         {:key => 'usi', :relation_value => 'tora'},
                         {:key => 'tora', :relation_value => 'mi'},
                         {:key => 'u', :relation_value => 'mi'},
                         {:key => 'tatsu', :relation_value => 'mi'},
                         {:key => 'mi', :relation_value => 'saru'},
                         {:key => 'uma', :relation_value => 'saru'},
                         {:key => 'hitsuji', :relation_value => 'saru'},
                         {:key => 'saru', :relation_value => 'i'},
                         {:key => 'tori', :relation_value => 'i'},
                         {:key => 'inu', :relation_value => 'i'},
                         {:key => 'i', :relation_value => 'tora'}]

        test_patterns.each do |pattern|
          it_behaves_like :happu_shi_2_check, pattern
          it_behaves_like :happu_shi_2_get, pattern
        end
      end

    end

    describe Junishi, "四廃" do
      describe Junishi, "干_1" do
        shared_examples_for :shihai_1_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shihai_1_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :shihai_1_kan_get do |params|
          subject{Junishi.by_key(key).shihai_1_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'hinoe'},
                         {:key => 'usi', :relation_value => 'hinoe'},
                         {:key => 'tora', :relation_value => 'kanoe'},
                         {:key => 'u', :relation_value => 'kanoe'},
                         {:key => 'tatsu', :relation_value => 'kanoe'},
                         {:key => 'mi', :relation_value => 'mizunoe'},
                         {:key => 'uma', :relation_value => 'mizunoe'},
                         {:key => 'hitsuji', :relation_value => 'mizunoe'},
                         {:key => 'saru', :relation_value => 'kinoe'},
                         {:key => 'tori', :relation_value => 'kinoe'},
                         {:key => 'inu', :relation_value => 'kinoe'},
                         {:key => 'i', :relation_value => 'hinoe'}]

        test_patterns.each do |pattern|
          it_behaves_like :shihai_1_kan_check, pattern
          it_behaves_like :shihai_1_kan_get, pattern
        end
      end
      describe Junishi, "干_2" do
        shared_examples_for :shihai_2_kan_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shihai_2_kan?(relation)}
          it_behaves_like :relation_check_for_jikkan, params
        end

        shared_examples_for :shihai_2_kan_get do |params|
          subject{Junishi.by_key(key).shihai_2_kan}
          it_behaves_like :relation_get_for_jikkan, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'kinoto'},
                         {:key => 'usi', :relation_value => 'kinoto'},
                         {:key => 'tora', :relation_value => 'kanoto'},
                         {:key => 'u', :relation_value => 'kanoto'},
                         {:key => 'tatsu', :relation_value => 'kanoto'},
                         {:key => 'mi', :relation_value => 'mizunoto'},
                         {:key => 'uma', :relation_value => 'mizunoto'},
                         {:key => 'hitsuji', :relation_value => 'mizunoto'},
                         {:key => 'saru', :relation_value => 'kinoto'},
                         {:key => 'tori', :relation_value => 'kinoto'},
                         {:key => 'inu', :relation_value => 'kinoto'},
                         {:key => 'i', :relation_value => 'kinoto'}]

        test_patterns.each do |pattern|
          it_behaves_like :shihai_2_kan_check, pattern
          it_behaves_like :shihai_2_kan_get, pattern
        end
      end

      describe Junishi, "支(1)" do
        shared_examples_for :shihai_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shihai_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shihai_shi_1_get do |params|
          subject{Junishi.by_key(key).shihai_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'mi'},
                         {:key => 'usi', :relation_value => 'mi'},
                         {:key => 'tora', :relation_value => 'saru'},
                         {:key => 'u', :relation_value => 'saru'},
                         {:key => 'tatsu', :relation_value => 'saru'},
                         {:key => 'mi', :relation_value => 'i'},
                         {:key => 'uma', :relation_value => 'i'},
                         {:key => 'hitsuji', :relation_value => 'i'},
                         {:key => 'saru', :relation_value => 'tora'},
                         {:key => 'tori', :relation_value => 'tora'},
                         {:key => 'inu', :relation_value => 'tora'},
                         {:key => 'i', :relation_value => 'mi'}]

        test_patterns.each do |pattern|
          it_behaves_like :shihai_shi_1_check, pattern
          it_behaves_like :shihai_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :shihai_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shihai_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shihai_shi_2_get do |params|
          subject{Junishi.by_key(key).shihai_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'uma'},
                         {:key => 'usi', :relation_value => 'uma'},
                         {:key => 'tora', :relation_value => 'tori'},
                         {:key => 'u', :relation_value => 'tori'},
                         {:key => 'tatsu', :relation_value => 'tori'},
                         {:key => 'mi', :relation_value => 'ne'},
                         {:key => 'uma', :relation_value => 'ne'},
                         {:key => 'hitsuji', :relation_value => 'ne'},
                         {:key => 'saru', :relation_value => 'u'},
                         {:key => 'tori', :relation_value => 'u'},
                         {:key => 'inu', :relation_value => 'u'},
                         {:key => 'i', :relation_value => 'uma'}]

        test_patterns.each do |pattern|
          it_behaves_like :shihai_shi_2_check, pattern
          it_behaves_like :shihai_shi_2_get, pattern
        end
      end

    end

    describe Junishi, "暴敗" do
      describe Junishi, "支(1)" do
        shared_examples_for :bouhai_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).bouhai_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :bouhai_shi_1_get do |params|
          subject{Junishi.by_key(key).bouhai_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                         {:key => 'usi', :relation_value => 'tora'},
                         {:key => 'tora', :relation_value => 'inu'},
                         {:key => 'u', :relation_value => 'inu'},
                         {:key => 'tatsu', :relation_value => 'inu'},
                         {:key => 'mi', :relation_value => 'tatsu'},
                         {:key => 'uma', :relation_value => 'tatsu'},
                         {:key => 'hitsuji', :relation_value => 'tatsu'},
                         {:key => 'saru', :relation_value => 'saru'},
                         {:key => 'tori', :relation_value => 'saru'},
                         {:key => 'inu', :relation_value => 'saru'},
                         {:key => 'i', :relation_value => 'tora'}]

        test_patterns.each do |pattern|
          it_behaves_like :bouhai_shi_1_check, pattern
          it_behaves_like :bouhai_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :bouhai_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).bouhai_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :bouhai_shi_2_get do |params|
          subject{Junishi.by_key(key).bouhai_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'u'},
                         {:key => 'usi', :relation_value => 'u'},
                         {:key => 'tora', :relation_value => 'i'},
                         {:key => 'u', :relation_value => 'i'},
                         {:key => 'tatsu', :relation_value => 'i'},
                         {:key => 'mi', :relation_value => 'mi'},
                         {:key => 'uma', :relation_value => 'mi'},
                         {:key => 'hitsuji', :relation_value => 'mi'},
                         {:key => 'saru', :relation_value => 'tori'},
                         {:key => 'tori', :relation_value => 'tori'},
                         {:key => 'inu', :relation_value => 'tori'},
                         {:key => 'i', :relation_value => 'u'}]

        test_patterns.each do |pattern|
          it_behaves_like :bouhai_shi_2_check, pattern
          it_behaves_like :bouhai_shi_2_get, pattern
        end
      end

      describe Junishi, "支(3)" do
        shared_examples_for :bouhai_shi_3_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).bouhai_3_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :bouhai_shi_3_get do |params|
          subject{Junishi.by_key(key).bouhai_3_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'uma'},
                         {:key => 'usi', :relation_value => 'uma'},
                         {:key => 'tora', :relation_value => 'hitsuji'},
                         {:key => 'u', :relation_value => 'hitsuji'},
                         {:key => 'tatsu', :relation_value => 'hitsuji'},
                         {:key => 'mi', :relation_value => 'ne'},
                         {:key => 'uma', :relation_value => 'ne'},
                         {:key => 'hitsuji', :relation_value => 'ne'},
                         {:key => 'saru', :relation_value => 'inu'},
                         {:key => 'tori', :relation_value => 'inu'},
                         {:key => 'inu', :relation_value => 'inu'},
                         {:key => 'i', :relation_value => 'uma'}]

        test_patterns.each do |pattern|
          it_behaves_like :bouhai_shi_3_check, pattern
          it_behaves_like :bouhai_shi_3_get, pattern
        end
      end
    end

    describe Junishi, "下情" do
      describe Junishi, "支(1)" do
        shared_examples_for :kajou_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kajou_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kajou_shi_1_get do |params|
          subject{Junishi.by_key(key).kajou_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'ne'},
                         {:key => 'u', :relation_value => 'ne'},
                         {:key => 'tatsu', :relation_value => 'ne'},
                         {:key => 'mi', :relation_value => 'inu'},
                         {:key => 'uma', :relation_value => 'inu'},
                         {:key => 'hitsuji', :relation_value => 'inu'},
                         {:key => 'saru', :relation_value => 'saru'},
                         {:key => 'tori', :relation_value => 'saru'},
                         {:key => 'inu', :relation_value => 'saru'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :kajou_shi_1_check, pattern
          it_behaves_like :kajou_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :kajou_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kajou_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kajou_shi_2_get do |params|
          subject{Junishi.by_key(key).kajou_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'usi'},
                         {:key => 'u', :relation_value => 'usi'},
                         {:key => 'tatsu', :relation_value => 'usi'},
                         {:key => 'mi', :relation_value => 'i'},
                         {:key => 'uma', :relation_value => 'i'},
                         {:key => 'hitsuji', :relation_value => 'i'},
                         {:key => 'saru', :relation_value => 'usi'},
                         {:key => 'tori', :relation_value => 'usi'},
                         {:key => 'inu', :relation_value => 'usi'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :kajou_shi_2_check, pattern
          it_behaves_like :kajou_shi_2_get, pattern
        end
      end

      describe Junishi, "支(3)" do
        shared_examples_for :kajou_shi_3_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kajou_3_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kajou_shi_3_get do |params|
          subject{Junishi.by_key(key).kajou_3_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'uma'},
                         {:key => 'usi', :relation_value => 'uma'},
                         {:key => 'tora', :relation_value => 'tora'},
                         {:key => 'u', :relation_value => 'tora'},
                         {:key => 'tatsu', :relation_value => 'tora'},
                         {:key => 'mi', :relation_value => 'mi'},
                         {:key => 'uma', :relation_value => 'mi'},
                         {:key => 'hitsuji', :relation_value => 'mi'},
                         {:key => 'saru', :relation_value => 'usi'},
                         {:key => 'tori', :relation_value => 'usi'},
                         {:key => 'inu', :relation_value => 'usi'},
                         {:key => 'i', :relation_value => 'uma'}]

        test_patterns.each do |pattern|
          it_behaves_like :kajou_shi_3_check, pattern
          it_behaves_like :kajou_shi_3_get, pattern
        end
      end

      describe Junishi, "支(4)" do
        shared_examples_for :kajou_shi_4_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kajou_4_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kajou_shi_4_get do |params|
          subject{Junishi.by_key(key).kajou_4_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                         {:key => 'usi', :relation_value => 'ne'},
                         {:key => 'tora', :relation_value => 'tori'},
                         {:key => 'u', :relation_value => 'tori'},
                         {:key => 'tatsu', :relation_value => 'tori'},
                         {:key => 'mi', :relation_value => 'i'},
                         {:key => 'uma', :relation_value => 'i'},
                         {:key => 'hitsuji', :relation_value => 'i'},
                         {:key => 'saru', :relation_value => 'saru'},
                         {:key => 'tori', :relation_value => 'saru'},
                         {:key => 'inu', :relation_value => 'saru'},
                         {:key => 'i', :relation_value => 'ne'}]

        test_patterns.each do |pattern|
          it_behaves_like :kajou_shi_4_check, pattern
          it_behaves_like :kajou_shi_4_get, pattern
        end
      end

    end

    describe Junishi, "隔角" do
      describe Junishi, "支(1)" do
        shared_examples_for :kakukaku_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kakukaku_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kakukaku_shi_1_get do |params|
          subject{Junishi.by_key(key).kakukaku_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'usi'},
                         {:key => 'usi', :relation_value => 'usi'},
                         {:key => 'tora', :relation_value => 'tatsu'},
                         {:key => 'u', :relation_value => 'tatsu'},
                         {:key => 'tatsu', :relation_value => 'tatsu'},
                         {:key => 'mi', :relation_value => 'hitsuji'},
                         {:key => 'uma', :relation_value => 'hitsuji'},
                         {:key => 'hitsuji', :relation_value => 'hitsuji'},
                         {:key => 'saru', :relation_value => 'inu'},
                         {:key => 'tori', :relation_value => 'inu'},
                         {:key => 'inu', :relation_value => 'inu'},
                         {:key => 'i', :relation_value => 'usi'}]

        test_patterns.each do |pattern|
          it_behaves_like :kakukaku_shi_1_check, pattern
          it_behaves_like :kakukaku_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :kakukaku_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).kakukaku_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :kakukaku_shi_2_get do |params|
          subject{Junishi.by_key(key).kakukaku_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                         {:key => 'usi', :relation_value => 'tora'},
                         {:key => 'tora', :relation_value => 'mi'},
                         {:key => 'u', :relation_value => 'mi'},
                         {:key => 'tatsu', :relation_value => 'mi'},
                         {:key => 'mi', :relation_value => 'saru'},
                         {:key => 'uma', :relation_value => 'saru'},
                         {:key => 'hitsuji', :relation_value => 'saru'},
                         {:key => 'saru', :relation_value => 'i'},
                         {:key => 'tori', :relation_value => 'i'},
                         {:key => 'inu', :relation_value => 'i'},
                         {:key => 'i', :relation_value => 'tora'}]

        test_patterns.each do |pattern|
          it_behaves_like :kakukaku_shi_2_check, pattern
          it_behaves_like :kakukaku_shi_2_get, pattern
        end
      end
    end

    describe Junishi, "浴盆" do
      describe Junishi, "支" do
        shared_examples_for :yokubon_shi_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).yokubon_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :yokubon_shi_get do |params|
          subject{Junishi.by_key(key).yokubon_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'usi'},
                         {:key => 'usi', :relation_value => 'usi'},
                         {:key => 'tora', :relation_value => 'tatsu'},
                         {:key => 'u', :relation_value => 'tatsu'},
                         {:key => 'tatsu', :relation_value => 'tatsu'},
                         {:key => 'mi', :relation_value => 'hitsuji'},
                         {:key => 'uma', :relation_value => 'hitsuji'},
                         {:key => 'hitsuji', :relation_value => 'hitsuji'},
                         {:key => 'saru', :relation_value => 'inu'},
                         {:key => 'tori', :relation_value => 'inu'},
                         {:key => 'inu', :relation_value => 'inu'},
                         {:key => 'i', :relation_value => 'usi'}]

        test_patterns.each do |pattern|
          it_behaves_like :yokubon_shi_check, pattern
          it_behaves_like :yokubon_shi_get, pattern
        end
      end
    end

    describe Junishi, "深水" do
      describe Junishi, "支(1)" do
        shared_examples_for :shinsui_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shinsui_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shinsui_shi_1_get do |params|
          subject{Junishi.by_key(key).shinsui_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'hitsuji'},
                         {:key => 'usi', :relation_value => 'hitsuji'},
                         {:key => 'tora', :relation_value => 'tora'},
                         {:key => 'u', :relation_value => 'tora'},
                         {:key => 'tatsu', :relation_value => 'tora'},
                         {:key => 'mi', :relation_value => 'hitsuji'},
                         {:key => 'uma', :relation_value => 'hitsuji'},
                         {:key => 'hitsuji', :relation_value => 'hitsuji'},
                         {:key => 'saru', :relation_value => 'u'},
                         {:key => 'tori', :relation_value => 'u'},
                         {:key => 'inu', :relation_value => 'u'},
                         {:key => 'i', :relation_value => 'hitsuji'}]

        test_patterns.each do |pattern|
          it_behaves_like :shinsui_shi_1_check, pattern
          it_behaves_like :shinsui_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :shinsui_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shinsui_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shinsui_shi_2_get do |params|
          subject{Junishi.by_key(key).shinsui_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'i'},
                         {:key => 'usi', :relation_value => 'i'},
                         {:key => 'tora', :relation_value => 'saru'},
                         {:key => 'u', :relation_value => 'saru'},
                         {:key => 'tatsu', :relation_value => 'saru'},
                         {:key => 'mi', :relation_value => 'hitsuji'},
                         {:key => 'uma', :relation_value => 'hitsuji'},
                         {:key => 'hitsuji', :relation_value => 'hitsuji'},
                         {:key => 'saru', :relation_value => 'tori'},
                         {:key => 'tori', :relation_value => 'tori'},
                         {:key => 'inu', :relation_value => 'tori'},
                         {:key => 'i', :relation_value => 'i'}]

        test_patterns.each do |pattern|
          it_behaves_like :shinsui_shi_2_check, pattern
          it_behaves_like :shinsui_shi_2_get, pattern
        end
      end
    end

    describe Junishi, "将軍" do
      describe Junishi, "支(1)" do
        shared_examples_for :shogun_shi_1_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shogun_1_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shogun_shi_1_get do |params|
          subject{Junishi.by_key(key).shogun_1_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'saru'},
                         {:key => 'usi', :relation_value => 'saru'},
                         {:key => 'tora', :relation_value => 'tori'},
                         {:key => 'u', :relation_value => 'tori'},
                         {:key => 'tatsu', :relation_value => 'tori'},
                         {:key => 'mi', :relation_value => 'hitsuji'},
                         {:key => 'uma', :relation_value => 'hitsuji'},
                         {:key => 'hitsuji', :relation_value => 'hitsuji'},
                         {:key => 'saru', :relation_value => 'uma'},
                         {:key => 'tori', :relation_value => 'uma'},
                         {:key => 'inu', :relation_value => 'uma'},
                         {:key => 'i', :relation_value => 'saru'}]

        test_patterns.each do |pattern|
          it_behaves_like :shogun_shi_1_check, pattern
          it_behaves_like :shogun_shi_1_get, pattern
        end
      end

      describe Junishi, "支(2)" do
        shared_examples_for :shogun_shi_2_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shogun_2_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shogun_shi_2_get do |params|
          subject{Junishi.by_key(key).shogun_2_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'i'},
                         {:key => 'usi', :relation_value => 'i'},
                         {:key => 'tora', :relation_value => 'inu'},
                         {:key => 'u', :relation_value => 'inu'},
                         {:key => 'tatsu', :relation_value => 'inu'},
                         {:key => 'mi', :relation_value => 'ne'},
                         {:key => 'uma', :relation_value => 'ne'},
                         {:key => 'hitsuji', :relation_value => 'ne'},
                         {:key => 'saru', :relation_value => 'usi'},
                         {:key => 'tori', :relation_value => 'usi'},
                         {:key => 'inu', :relation_value => 'usi'},
                         {:key => 'i', :relation_value => 'i'}]

        test_patterns.each do |pattern|
          it_behaves_like :shogun_shi_2_check, pattern
          it_behaves_like :shogun_shi_2_get, pattern
        end
      end

      describe Junishi, "支(3)" do
        shared_examples_for :shogun_shi_3_check do |params|
          params[:expected_value] = true

          subject{Junishi.by_key(key).shogun_3_shi?(relation)}
          it_behaves_like :relation_check_for_junishi, params
        end

        shared_examples_for :shogun_shi_3_get do |params|
          subject{Junishi.by_key(key).shogun_3_shi}
          it_behaves_like :relation_get_for_junishi, params
        end

        test_patterns = [{:key => 'ne', :relation_value => 'mi'},
                         {:key => 'usi', :relation_value => 'mi'},
                         {:key => 'tora', :relation_value => 'tatsu'},
                         {:key => 'u', :relation_value => 'tatsu'},
                         {:key => 'tatsu', :relation_value => 'tatsu'},
                         {:key => 'mi', :relation_value => 'u'},
                         {:key => 'uma', :relation_value => 'u'},
                         {:key => 'hitsuji', :relation_value => 'u'},
                         {:key => 'saru', :relation_value => 'tora'},
                         {:key => 'tori', :relation_value => 'tora'},
                         {:key => 'inu', :relation_value => 'tora'},
                         {:key => 'i', :relation_value => 'mi'}]

        test_patterns.each do |pattern|
          it_behaves_like :shogun_shi_3_check, pattern
          it_behaves_like :shogun_shi_3_get, pattern
        end
      end

    end

  end
end
