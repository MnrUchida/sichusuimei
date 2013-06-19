# coding : utf-8

require 'spec_helper'
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
    shared_examples_for :relation_check_validation do |params|
      let(:key){params[:key]}

      it "#{params[:key]}" do
        subject.should == params[:expected_value]
      end
    end

    shared_examples_for :relation_get_validation do |params|
      let(:key){params[:key]}

      it "#{params[:key]}" do
        subject.should == expected
      end
    end

    shared_examples_for :relation_check_validation_junishi do |params|
      let(:relation){Junishi.by_key(params[:relation_value])}

      it_behaves_like :relation_check_validation, params
    end

    shared_examples_for :relation_check_validation_pillar do |params, chishi, tenkan|
      let(:relation){MeishikiPlr.new(:chishi_id => chishi.id, :tenkan_id => tenkan.id)}

      it_behaves_like :relation_check_validation, params
    end

    shared_examples_for :relation_check_validation_pillar_junishi do |params|
      it_behaves_like :relation_check_validation_pillar, params, Junishi.by_key(params[:relation_value]), Jikkan.by_key('kinoe')
    end

    shared_examples_for :relation_check_validation_pillar_jikkan do |params|
      it_behaves_like :relation_check_validation_pillar, params, Junishi.by_key('ne'), Jikkan.by_key(params[:relation_value])
    end

    shared_examples_for :relation_get_validation_junishi do |params|
      let(:expected){Junishi.by_key(params[:relation_value])}

      it_behaves_like :relation_get_validation, params
    end

    shared_examples_for :relation_get_validation_jikkan do |params|
      let(:expected){Jikkan.by_key(params[:relation_value])}

      it_behaves_like :relation_get_validation, params
    end

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

  end
end
