# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'

describe "月支" do
  shared_examples_for :pillar_check_by_junishi_for_junishi do |params|
    let(:junishi_id){Junishi.by_key(key).id}
    let(:pillar){params[:pillar].new(:chishi_id => junishi_id)}

    it_behaves_like :relation_check_for_pillar_by_junishi, params
  end

  shared_examples_for :pillar_check_by_junishi_for_jikkan do |params|
    let(:junishi_id){Junishi.by_key(key).id}
    let(:pillar){params[:pillar].new(:chishi_id => junishi_id)}

    it_behaves_like :relation_check_for_pillar_by_jikkan, params
  end

  shared_examples_for :pillar_check_by_junishi do |params, tenkan, chishi|
    let(:junishi_id){Junishi.by_key(key).id}
    let(:pillar){params[:pillar].new(:chishi_id => junishi_id)}

    it_behaves_like :relation_check_for_pillar, params, tenkan, chishi
  end

  describe "刑" do
    shared_examples_for :kei_check do |params|
      subject{pillar.kei?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => YearPillar, :key => 'ne', :relation_value => 'u', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'u', :relation_value => 'ne', :expected_value => true},
                     {:pillar => DayPillar, :key => 'tatsu', :relation_value => 'tatsu', :expected_value => true},
                     {:pillar => TimePillar, :key => 'ne', :relation_value => 'u', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :kei_check, pattern
    end
  end

  describe "冲" do
    shared_examples_for :chu_check do |params|
      subject{pillar.chu?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => YearPillar, :key => 'ne', :relation_value => 'uma', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'uma', :relation_value => 'ne', :expected_value => true},
                     {:pillar => DayPillar, :key => 'tatsu', :relation_value => 'inu', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :chu_check, pattern
    end

    let(:time_pillar){TimePillar.new(:chishi_id => 7)}
    it "時柱" do
      time_pillar.respond_to?(:chu?).should == false
    end
  end

  describe "破" do
    shared_examples_for :ha_check do |params|
      subject{pillar.ha?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => YearPillar, :key => 'ne', :relation_value => 'tori', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'tori', :relation_value => 'ne', :expected_value => true},
                     {:pillar => DayPillar, :key => 'tatsu', :relation_value => 'usi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :ha_check, pattern
    end

    let(:time_pillar){TimePillar.new(:chishi_id => 7)}
    it "時柱" do
      time_pillar.respond_to?(:ha?).should == false
    end
  end

  describe "害" do
    shared_examples_for :gai_check do |params|
      subject{pillar.gai?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => YearPillar, :key => 'ne', :relation_value => 'hitsuji', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'hitsuji', :relation_value => 'ne', :expected_value => true},
                     {:pillar => DayPillar, :key => 'tatsu', :relation_value => 'u', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :gai_check, pattern
    end

    let(:time_pillar){TimePillar.new(:chishi_id => 8)}
    it "時柱" do
      time_pillar.respond_to?(:gai?).should == false
    end
  end

  describe "支合" do
    shared_examples_for :shigou_check do |params|
      subject{pillar.shigou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => YearPillar, :key => 'tora', :relation_value => 'i', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'tora', :expected_value => true},
                     {:pillar => DayPillar, :key => 'tatsu', :relation_value => 'tori', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :shigou_check, pattern
    end

    let(:time_pillar){TimePillar.new(:chishi_id => 12)}
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


  describe "天徳貴人" do
    shared_examples_for :tentoku_kijin_check do |params|
      subject{pillar.tentoku_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'mi', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'tori', :relation_value => 'tora', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'u', :relation_value => 'saru', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'uma', :relation_value => 'i', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tentoku_kijin_check, pattern
    end
  end

  describe "天徳貴人" do
    shared_examples_for :tentoku_kijin_check_jikkan do |params|
      subject{pillar.tentoku_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_jikkan, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'usi', :relation_value => 'kanoe', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'mi', :relation_value => 'kanoto', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tentoku_kijin_check_jikkan, pattern
    end
  end

  describe "天徳合" do
    shared_examples_for :tentoku_gou_check do |params|
      subject{pillar.tentoku_gou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'saru', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'uma', :relation_value => 'tora', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tentoku_gou_check, pattern
    end
  end

  describe "天徳合" do
    shared_examples_for :tentoku_gou_check_jikkan do |params|
      subject{pillar.tentoku_gou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_jikkan, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'usi', :relation_value => 'kinoto', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'mi', :relation_value => 'hinoe', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tentoku_gou_check_jikkan, pattern
    end
  end

  describe "喪門" do
    shared_examples_for :momon_check do |params|
      subject{pillar.momon?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'tora', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'uma', :relation_value => 'saru', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :momon_check, pattern
    end
  end

  describe Junishi, "華蓋" do
    shared_examples_for :kagai_check do |params|
      subject{pillar.kagai?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'tatsu', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'uma', :relation_value => 'inu', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :kagai_check, pattern
    end
  end

  describe Junishi, "天耗" do
    shared_examples_for :tenmou_check do |params|
      subject{pillar.tenmou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'saru', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'u', :relation_value => 'tora', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :tenmou_check, pattern
    end
  end

  describe Junishi, "地耗" do
    shared_examples_for :chimou_check do |params|
      subject{pillar.chimou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'mi', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'u', :relation_value => 'i', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :chimou_check, pattern
    end
  end

  describe Junishi, "白衣" do
    shared_examples_for :byakui_check do |params|
      subject{pillar.byakui?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'tori', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'tora', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :byakui_check, pattern
    end
  end

  describe Junishi, "断橋" do
    shared_examples_for :dankyo_check do |params|
      subject{pillar.dankyo?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'ne', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'hitsuji', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :dankyo_check, pattern
    end
  end

  describe Junishi, "血支" do
    shared_examples_for :kessi_check do |params|
      subject{pillar.kessi?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'saru', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'hitsuji', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :kessi_check, pattern
    end
  end

  describe Junishi, "月徳貴人" do
    shared_examples_for :gettoku_kijin_check do |params|
      subject{pillar.gettoku_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_jikkan, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'mizunoe', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'kinoe', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :gettoku_kijin_check, pattern
    end
  end

  describe Junishi, "月徳合" do
    shared_examples_for :gettoku_gou_check do |params|
      subject{pillar.gettoku_gou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_jikkan, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'hinoto', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'tsuchinoto', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :gettoku_gou_check, pattern
    end

  end

  describe Junishi, "月空" do
    shared_examples_for :gekku_check do |params|
      subject{pillar.gekku?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_jikkan, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'hinoe', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'kanoe', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :gekku_check, pattern
    end
  end

  describe Junishi, "駅馬" do
    shared_examples_for :ekiba_check do |params|
      subject{pillar.ekiba?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :relation_value => 'tora', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :relation_value => 'mi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :ekiba_check, pattern
    end
  end

  describe Junishi, "生成馬" do
    shared_examples_for :seiseiba_check do |params|
      subject{pillar.seiseiba?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:pillar => MonthPillar, :key => 'ne', :tenkan => 'kinoe', :chishi => 'tora', :expected_value => true},
                     {:pillar => MonthPillar, :key => 'i', :tenkan => 'hinoto', :chishi => 'mi', :expected_value => true}]

    test_patterns.each do |pattern|
      it_behaves_like :seiseiba_check, pattern
    end
  end
end

describe "十干" do
  shared_examples_for :pillar_check_by_jikkan_for_junishi do |params|
    let(:jikkan_id){Jikkan.by_key(key).id}
    let(:pillar){params[:pillar].new(:tenkan_id => jikkan_id)}
    params[:pillar] = DayPillar
    params[:expected_value] = true

    it_behaves_like :relation_check_for_pillar_by_junishi, params
  end

  shared_examples_for :pillar_check_by_jikkan_for_junishi_with_relations do |params|
    let(:jikkan_id){Jikkan.by_key(key).id}
    let(:pillar){params[:pillar].new(:tenkan_id => jikkan_id)}
    params[:pillar] = DayPillar
    params[:expected_value] = true

    it_behaves_like :relation_check_for_pillar_by_junishi_with_relations, params
  end

  shared_examples_for :pillar_check_by_jikkan_for_jikkan do |params|
    let(:jikkan_id){Jikkan.by_key(key).id}
    let(:pillar){params[:pillar].new(:tenkan_id => jikkan_id)}
    params[:pillar] = DayPillar
    params[:expected_value] = true

    it_behaves_like :relation_check_for_pillar_by_jikkan, params
  end

  shared_examples_for :pillar_check_by_jikkan do |params, tenkan, chishi|
    let(:jikkan_id){Jikkan.by_key(key).id}
    let(:pillar){params[:pillar].new(:tenkan_id => jikkan_id)}
    params[:pillar] = DayPillar
    params[:expected_value] = true

    it_behaves_like :relation_check_for_pillar, params, tenkan, chishi
  end

  describe Jikkan, "干合" do
    shared_examples_for :kangou_check do |params|
      subject{pillar.kangou?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_jikkan, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tsuchinoto'},
                     {:key => 'mizunoto', :relation_value => 'tsuchinoe'}]

    test_patterns.each do |pattern|
      it_behaves_like :kangou_check, pattern
    end
  end

  describe Jikkan, "大極貴人" do
    shared_examples_for :taikyoku_kijin_check do |params|
      subject{pillar.taikyoku_kijin?(:target_pillar => relations[0], :target2_pillar => relations[1], :target3_pillar => relations[2], :target4_pillar => relations[3])}
      it_behaves_like :pillar_check_by_jikkan_for_junishi_with_relations, params
    end

    test_patterns = [{:key => 'kinoe', :relations => [{:type => YearPillar, :value => 'ne'},
                                                      {:type => MonthPillar, :value => 'uma'},
                                                      {:type => DayPillar, :value => 'inu'},
                                                      {:type => TimePillar, :value => 'i'}]},
                     {:key => 'kinoe', :relations => [{:type => YearPillar, :value => 'tori'},
                                                      {:type => MonthPillar, :value => 'ne'},
                                                      {:type => DayPillar, :value => 'uma'},
                                                      {:type => TimePillar, :value => 'i'}]},
                     {:key => 'kinoe', :relations => [{:type => YearPillar, :value => 'inu'},
                                                      {:type => MonthPillar, :value => 'ne'},
                                                      {:type => DayPillar, :value => 'i'},
                                                      {:type => TimePillar, :value => 'uma'}]},
                     {:key => 'tsuchinoe', :relations => [{:type => YearPillar, :value => 'inu'},
                                                      {:type => MonthPillar, :value => 'usi'},
                                                      {:type => DayPillar, :value => 'hitsuji'},
                                                      {:type => TimePillar, :value => 'tatsu'}]},
                     {:key => 'mizunoto', :relations => [{:type => YearPillar, :value => 'mi'},
                                                          {:type => MonthPillar, :value => 'saru'},
                                                          {:type => DayPillar, :value => 'ne'},
                                                          {:type => TimePillar, :value => 'uma'}]}]

    test_patterns.each do |pattern|
      it_behaves_like :taikyoku_kijin_check, pattern
    end
  end

  describe Jikkan, "天乙貴人" do
    shared_examples_for :tenotsu_kijin_check do |params|
      subject{pillar.tenotsu_kijin?(:target_pillar => relations[0], :target2_pillar => relations[1])}
      it_behaves_like :pillar_check_by_jikkan_for_junishi_with_relations, params
    end

    test_patterns = [{:key => 'kinoe', :relations => [{:type => MeishikiPlr, :value => 'usi'},
                                                      {:type => MeishikiPlr, :value => 'hitsuji'}]},
                     {:key => 'kinoe', :relations => [{:type => MeishikiPlr, :value => 'hitsuji'},
                                                      {:type => MeishikiPlr, :value => 'usi'}]},
                     {:key => 'tsuchinoto', :relations => [{:type => MeishikiPlr, :value => 'saru'},
                                                          {:type => MeishikiPlr, :value => 'ne'}]},
                     {:key => 'mizunoto', :relations => [{:type => MeishikiPlr, :value => 'mi'},
                                                         {:type => MeishikiPlr, :value => 'u'}]}]

    test_patterns.each do |pattern|
      it_behaves_like :tenotsu_kijin_check, pattern
    end
  end

  describe Jikkan, "天官貴人" do
    shared_examples_for :tenkan_kijin_check do |params|
      subject{pillar.tenkan_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'hitsuji'},
                     {:key => 'mizunoto', :relation_value => 'uma'}]

    test_patterns.each do |pattern|
      it_behaves_like :tenkan_kijin_check, pattern
    end
  end

  describe Jikkan, "天福貴人" do
    shared_examples_for :tenhuku_kijin_check do |params|
      subject{pillar.tenhuku_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tora'},
                     {:key => 'mizunoto', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :tenhuku_kijin_check, pattern
    end
  end

  describe Jikkan, "暗禄" do
    shared_examples_for :anroku_check do |params|
      subject{pillar.anroku?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'i'},
                     {:key => 'mizunoto', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :anroku_check, pattern
    end
  end

  describe Jikkan, "干禄" do
    shared_examples_for :kanroku_check do |params|
      subject{pillar.kanroku?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tora'},
                     {:key => 'mizunoto', :relation_value => 'ne'}]

    test_patterns.each do |pattern|
      it_behaves_like :kanroku_check, pattern
    end
  end

  describe Jikkan, "富貴学童" do
    shared_examples_for :fukigakudo_check do |params|
      subject{pillar.fukigakudo?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'i'},
                     {:key => 'mizunoto', :relation_value => 'u'}]

    test_patterns.each do |pattern|
      it_behaves_like :fukigakudo_check, pattern
    end
  end

  describe Jikkan, "天厨貴人" do
    shared_examples_for :tenchukijin_check do |params|
      subject{pillar.tenchukijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'mi'},
                     {:key => 'mizunoto', :relation_value => 'u'}]

    test_patterns.each do |pattern|
      it_behaves_like :tenchukijin_check, pattern
    end
  end

  describe Jikkan, "金輿禄" do
    shared_examples_for :kinyoroku_check do |params|
      subject{pillar.kinyoroku?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tatsu'},
                     {:key => 'mizunoto', :relation_value => 'tora'}]

    test_patterns.each do |pattern|
      it_behaves_like :kinyoroku_check, pattern
    end
  end

  describe Jikkan, "学士" do
    shared_examples_for :gakushi_check do |params|
      subject{pillar.gakushi?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'ne'},
                     {:key => 'mizunoto', :relation_value => 'saru'}]

    test_patterns.each do |pattern|
      it_behaves_like :gakushi_check, pattern
    end
  end

  describe Jikkan, "天財" do
    shared_examples_for :tenzai_check do |params|
      subject{pillar.tenzai?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_jikkan, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tsuchinoe'},
                     {:key => 'mizunoto', :relation_value => 'hinoto'}]

    test_patterns.each do |pattern|
      it_behaves_like :tenzai_check, pattern
    end
  end

  describe Jikkan, "夾禄" do
    shared_examples_for :kyoroku_check do |params|
      subject{pillar.kyoroku?(:target_pillar => relations[0], :target2_pillar => relations[1])}
      it_behaves_like :pillar_check_by_jikkan_for_junishi_with_relations, params
    end

    test_patterns = [{:key => 'kinoe', :relations => [{:type => MeishikiPlr, :value => 'usi'},
                                                      {:type => MeishikiPlr, :value => 'u'}]},
                     {:key => 'kinoe', :relations => [{:type => MeishikiPlr, :value => 'u'},
                                                      {:type => MeishikiPlr, :value => 'usi'}]},
                     {:key => 'tsuchinoto', :relations => [{:type => MeishikiPlr, :value => 'mi'},
                                                           {:type => MeishikiPlr, :value => 'hitsuji'}]},
                     {:key => 'mizunoto', :relations => [{:type => MeishikiPlr, :value => 'i'},
                                                         {:type => MeishikiPlr, :value => 'usi'}]}]

    test_patterns.each do |pattern|
      it_behaves_like :kyoroku_check, pattern
    end
  end

  describe Jikkan, "羊刃" do
    shared_examples_for :youjin_check do |params|
      subject{pillar.youjin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'u'},
                     {:key => 'mizunoto', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :youjin_check, pattern
    end
  end

  describe Jikkan, "飛刃" do
    shared_examples_for :hijin_check do |params|
      subject{pillar.hijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tori'},
                     {:key => 'mizunoto', :relation_value => 'hitsuji'}]

    test_patterns.each do |pattern|
      it_behaves_like :hijin_check, pattern
    end
  end

  describe Jikkan, "紅艶" do
    shared_examples_for :kouen_check do |params|
      subject{pillar.kouen?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'saru'},
                     {:key => 'mizunoto', :relation_value => 'saru'}]

    test_patterns.each do |pattern|
      it_behaves_like :kouen_check, pattern
    end
  end

  describe Jikkan, "流霞" do
    shared_examples_for :ryuka_check do |params|
      subject{pillar.ryuka?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tori'},
                     {:key => 'mizunoto', :relation_value => 'tora'}]

    test_patterns.each do |pattern|
      it_behaves_like :ryuka_check, pattern
    end
  end

  describe Jikkan, "福星貴人" do
    shared_examples_for :fukusei_kijin_check do |params|
      subject{pillar.fukusei_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'tora'},
                     {:key => 'mizunoto', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :fukusei_kijin_check, pattern
    end
  end

  describe Jikkan, "文星貴人" do
    shared_examples_for :bunsei_kijin_check do |params|
      subject{pillar.bunsei_kijin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'mi'},
                     {:key => 'mizunoto', :relation_value => 'u'}]

    test_patterns.each do |pattern|
      it_behaves_like :bunsei_kijin_check, pattern
    end
  end

  describe Jikkan, "節度人" do
    shared_examples_for :setsudojin_check do |params|
      subject{pillar.setsudojin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_jikkan_for_junishi, params
    end

    test_patterns = [{:key => 'kinoe', :relation_value => 'mi'},
                     {:key => 'mizunoto', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :setsudojin_check, pattern
    end
  end
end

describe "四季" do
  describe Junishi, "進神" do
    shared_examples_for :sinjin_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.sinjin?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoto', :chishi => 'tori'},
                     {:key => 'tora', :tenkan => 'kinoe', :chishi => 'ne'},
                     {:key => 'mi', :tenkan => 'kinoe', :chishi => 'uma'},
                     {:key => 'tori', :tenkan => 'tsuchinoto', :chishi => 'u'}]

    test_patterns.each do |pattern|
      it_behaves_like :sinjin_check, pattern
    end
  end

  describe Junishi, "天赦" do
    shared_examples_for :tensha_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.tensha?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'kinoe', :chishi => 'ne'},
                     {:key => 'tora', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                     {:key => 'mi', :tenkan => 'kinoe', :chishi => 'uma'},
                     {:key => 'tori', :tenkan => 'tsuchinoe', :chishi => 'saru'}]

    test_patterns.each do |pattern|
      it_behaves_like :tensha_check, pattern
    end
  end

  describe Junishi, "座敗" do
    describe "座敗" do
      shared_examples_for :zahai_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.zahai?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'kinoe', :chishi => 'saru'},
                       {:key => 'mi', :tenkan => 'kanoto', :chishi => 'tori'},
                       {:key => 'tori', :tenkan => 'mizunoto', :chishi => 'hitsuji'}]

      test_patterns.each do |pattern|
        it_behaves_like :zahai_check, pattern
      end
    end

    describe "1つめ" do
      shared_examples_for :zahai_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.zahai_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'kinoe', :chishi => 'mi'},
                       {:key => 'mi', :tenkan => 'kinoto', :chishi => 'tori'},
                       {:key => 'tori', :tenkan => 'hinoto', :chishi => 'usi'}]

      test_patterns.each do |pattern|
        it_behaves_like :zahai_1_check, pattern
      end
    end

    describe "2つめ" do
      shared_examples_for :zahai_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.zahai_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'kinoe', :chishi => 'saru'},
                       {:key => 'mi', :tenkan => 'kinoto', :chishi => 'tori'},
                       {:key => 'tori', :tenkan => 'hinoto', :chishi => 'usi'}]

      test_patterns.each do |pattern|
        it_behaves_like :zahai_2_check, pattern
      end
    end

    describe "3つめ" do
      shared_examples_for :zahai_3_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.zahai_3?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'kinoe', :chishi => 'u'},
                       {:key => 'mi', :tenkan => 'kanoto', :chishi => 'tori'},
                       {:key => 'tori', :tenkan => 'mizunoto', :chishi => 'hitsuji'}]

      test_patterns.each do |pattern|
        it_behaves_like :zahai_3_check, pattern
      end
    end

    describe "4つめ" do
      shared_examples_for :zahai_4_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.zahai_4?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'tsuchinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'kinoto', :chishi => 'u'},
                       {:key => 'mi', :tenkan => 'kanoto', :chishi => 'tori'},
                       {:key => 'tori', :tenkan => 'mizunoto', :chishi => 'hitsuji'}]

      test_patterns.each do |pattern|
        it_behaves_like :zahai_4_check, pattern
      end
    end
  end

  describe Junishi, "天転" do
    shared_examples_for :tenten_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.tenten?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'mizunoe', :chishi => 'ne'},
                     {:key => 'tora', :tenkan => 'kinoto', :chishi => 'u'},
                     {:key => 'mi', :tenkan => 'hinoe', :chishi => 'uma'},
                     {:key => 'tori', :tenkan => 'kanoto', :chishi => 'tori'}]

    test_patterns.each do |pattern|
      it_behaves_like :tenten_check, pattern
    end
  end

  describe Junishi, "地転" do
    shared_examples_for :chiten_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.chiten?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'hinoe', :chishi => 'ne'},
                     {:key => 'tora', :tenkan => 'kanoto', :chishi => 'u'},
                     {:key => 'mi', :tenkan => 'tsuchinoe', :chishi => 'uma'},
                     {:key => 'tori', :tenkan => 'mizunoto', :chishi => 'tori'}]

    test_patterns.each do |pattern|
      it_behaves_like :chiten_check, pattern
    end
  end

  describe Junishi, "天殺" do
    shared_examples_for :tensatsu_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.tensatsu?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'kanoe', :chishi => 'ne'},
                     {:key => 'tora', :tenkan => 'mizunoto', :chishi => 'u'},
                     {:key => 'mi', :tenkan => 'hinoe', :chishi => 'uma'},
                     {:key => 'tori', :tenkan => 'hinoto', :chishi => 'tori'}]

    test_patterns.each do |pattern|
      it_behaves_like :tensatsu_check, pattern
    end
  end

  describe Junishi, "八風" do
    describe Junishi, "八風" do
      shared_examples_for :happu_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.happu?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'kinoe', :chishi => 'inu'},
                       {:key => 'tora', :tenkan => 'hinoto', :chishi => 'mi'},
                       {:key => 'mi', :tenkan => 'kinoe', :chishi => 'saru'},
                       {:key => 'tori', :tenkan => 'hinoto', :chishi => 'hitsuji'}]

      test_patterns.each do |pattern|
        it_behaves_like :happu_check, pattern
      end
    end

    describe Junishi, "1" do
      shared_examples_for :happu_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.happu_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'kinoe', :chishi => 'inu'},
                       {:key => 'tora', :tenkan => 'hinoto', :chishi => 'usi'},
                       {:key => 'mi', :tenkan => 'kinoe', :chishi => 'tatsu'},
                       {:key => 'tori', :tenkan => 'hinoto', :chishi => 'hitsuji'}]

      test_patterns.each do |pattern|
        it_behaves_like :happu_1_check, pattern
      end
    end

    describe Junishi, "2" do
      shared_examples_for :happu_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.happu_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'kinoe', :chishi => 'tora'},
                       {:key => 'tora', :tenkan => 'hinoto', :chishi => 'mi'},
                       {:key => 'mi', :tenkan => 'kinoe', :chishi => 'saru'},
                       {:key => 'tori', :tenkan => 'hinoto', :chishi => 'i'}]

      test_patterns.each do |pattern|
        it_behaves_like :happu_2_check, pattern
      end
    end
  end

  describe Junishi, "四廃" do
    shared_examples_for :shihai_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.shihai?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi,
                      params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
    end

    test_patterns = [{:key => 'ne', :tenkan => 'kinoto', :chishi => 'mi'},
                     {:key => 'tora', :tenkan => 'kanoto', :chishi => 'tori'},
                     {:key => 'mi', :tenkan => 'mizunoe', :chishi => 'ne'},
                     {:key => 'tori', :tenkan => 'kinoe', :chishi => 'tora'}]

    test_patterns.each do |pattern|
      it_behaves_like :shihai_check, pattern
    end

    describe Junishi, "1" do
      shared_examples_for :shihai_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shihai_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'kinoto', :chishi => 'mi'},
                       {:key => 'tora', :tenkan => 'kanoe', :chishi => 'saru'},
                       {:key => 'mi', :tenkan => 'mizunoto', :chishi => 'i'},
                       {:key => 'tori', :tenkan => 'kinoe', :chishi => 'tora'}]

      test_patterns.each do |pattern|
        it_behaves_like :shihai_1_check, pattern
      end
    end

    describe Junishi, "2" do
      shared_examples_for :shihai_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shihai_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi,
                        params, Junishi.by_key(params[:chishi]), Jikkan.by_key(params[:tenkan])
      end

      test_patterns = [{:key => 'ne', :tenkan => 'hinoe', :chishi => 'uma'},
                       {:key => 'tora', :tenkan => 'kanoto', :chishi => 'tori'},
                       {:key => 'mi', :tenkan => 'mizunoe', :chishi => 'ne'},
                       {:key => 'tori', :tenkan => 'kinoto', :chishi => 'u'}]

      test_patterns.each do |pattern|
        it_behaves_like :shihai_2_check, pattern
      end
    end
  end

  describe Junishi, "暴敗" do
    describe Junishi, "all" do
      shared_examples_for :bouhai_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.bouhai?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                       {:key => 'tora', :relation_value => 'i'},
                       {:key => 'mi', :relation_value => 'ne'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'tora'}]

      test_patterns.each do |pattern|
        it_behaves_like :bouhai_check, pattern
      end
    end

    describe Junishi, "支(1)" do
      shared_examples_for :bouhai_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.bouhai_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'tora'},
                       {:key => 'tora', :relation_value => 'inu'},
                       {:key => 'mi', :relation_value => 'tatsu'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'tora'}]

      test_patterns.each do |pattern|
        it_behaves_like :bouhai_1_check, pattern
      end
    end

    describe Junishi, "支(2)" do
      shared_examples_for :bouhai_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.bouhai_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'u'},
                       {:key => 'tora', :relation_value => 'i'},
                       {:key => 'mi', :relation_value => 'mi'},
                       {:key => 'saru', :relation_value => 'tori'},
                       {:key => 'i', :relation_value => 'u'}]

      test_patterns.each do |pattern|
        it_behaves_like :bouhai_2_check, pattern
      end
    end

    describe Junishi, "支(3)" do
      shared_examples_for :bouhai_3_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.bouhai_3?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'uma'},
                       {:key => 'tora', :relation_value => 'hitsuji'},
                       {:key => 'mi', :relation_value => 'ne'},
                       {:key => 'saru', :relation_value => 'inu'},
                       {:key => 'i', :relation_value => 'uma'}]

      test_patterns.each do |pattern|
        it_behaves_like :bouhai_3_check, pattern
      end
    end
  end

  describe Junishi, "下情" do
    describe Junishi, "all" do
      shared_examples_for :kajou_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kajou?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                       {:key => 'tora', :relation_value => 'ne'},
                       {:key => 'mi', :relation_value => 'inu'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'ne'},
                       {:key => 'usi', :relation_value => 'ne'},
                       {:key => 'u', :relation_value => 'usi'},
                       {:key => 'uma', :relation_value => 'i'},
                       {:key => 'tori', :relation_value => 'usi'},
                       {:key => 'tatsu', :relation_value => 'tora'},
                       {:key => 'hitsuji', :relation_value => 'mi'},
                       {:key => 'inu', :relation_value => 'usi'},
                       {:key => 'i', :relation_value => 'uma'},
                       {:key => 'ne', :relation_value => 'ne'},
                       {:key => 'u', :relation_value => 'tori'},
                       {:key => 'hitsuji', :relation_value => 'i'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'ne'}]

      test_patterns.each do |pattern|
        it_behaves_like :kajou_check, pattern
      end
    end

    describe Junishi, "支(1)" do
      shared_examples_for :kajou_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kajou_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                       {:key => 'tora', :relation_value => 'ne'},
                       {:key => 'mi', :relation_value => 'inu'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'ne'}]

      test_patterns.each do |pattern|
        it_behaves_like :kajou_1_check, pattern
      end
    end

    describe Junishi, "支(2)" do
      shared_examples_for :kajou_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kajou_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'usi', :relation_value => 'ne'},
                       {:key => 'u', :relation_value => 'usi'},
                       {:key => 'uma', :relation_value => 'i'},
                       {:key => 'tori', :relation_value => 'usi'}]

      test_patterns.each do |pattern|
        it_behaves_like :kajou_2_check, pattern
      end
    end

    describe Junishi, "支(3)" do
      shared_examples_for :kajou_3_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kajou_3?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'tatsu', :relation_value => 'tora'},
                       {:key => 'hitsuji', :relation_value => 'mi'},
                       {:key => 'inu', :relation_value => 'usi'},
                       {:key => 'i', :relation_value => 'uma'}]

      test_patterns.each do |pattern|
        it_behaves_like :kajou_3_check, pattern
      end
    end

    describe Junishi, "支(4)" do
      shared_examples_for :kajou_4_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kajou_4?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'ne'},
                       {:key => 'u', :relation_value => 'tori'},
                       {:key => 'hitsuji', :relation_value => 'i'},
                       {:key => 'saru', :relation_value => 'saru'},
                       {:key => 'i', :relation_value => 'ne'}]

      test_patterns.each do |pattern|
        it_behaves_like :kajou_4_check, pattern
      end
    end
  end

  describe Junishi, "隔角" do
    describe Junishi, "all" do
      shared_examples_for :kakukaku_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kakukaku?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'usi'},
                       {:key => 'u', :relation_value => 'tatsu'},
                       {:key => 'uma', :relation_value => 'hitsuji'},
                       {:key => 'tori', :relation_value => 'inu'},
                       {:key => 'usi', :relation_value => 'tora'},
                       {:key => 'tatsu', :relation_value => 'mi'},
                       {:key => 'hitsuji', :relation_value => 'saru'},
                       {:key => 'inu', :relation_value => 'i'}]

      test_patterns.each do |pattern|
        it_behaves_like :kakukaku_check, pattern
      end
    end

    describe Junishi, "支(1)" do
      shared_examples_for :kakukaku_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kakukaku_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'usi'},
                       {:key => 'u', :relation_value => 'tatsu'},
                       {:key => 'uma', :relation_value => 'hitsuji'},
                       {:key => 'tori', :relation_value => 'inu'}]

      test_patterns.each do |pattern|
        it_behaves_like :kakukaku_1_check, pattern
      end
    end

    describe Junishi, "支(2)" do
      shared_examples_for :kakukaku_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.kakukaku_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'usi', :relation_value => 'tora'},
                       {:key => 'tatsu', :relation_value => 'mi'},
                       {:key => 'hitsuji', :relation_value => 'saru'},
                       {:key => 'inu', :relation_value => 'i'}]

      test_patterns.each do |pattern|
        it_behaves_like :kakukaku_2_check, pattern
      end
    end
  end

  describe Junishi, "浴盆" do
    shared_examples_for :yokubon_check do |params|
      params[:expected_value] = true
      params[:pillar] = MonthPillar

      subject{pillar.yokubon?(:target_pillar => relation)}
      it_behaves_like :pillar_check_by_junishi_for_junishi, params
    end

    test_patterns = [{:key => 'ne', :relation_value => 'usi'},
                     {:key => 'tora', :relation_value => 'tatsu'},
                     {:key => 'hitsuji', :relation_value => 'hitsuji'},
                     {:key => 'tori', :relation_value => 'inu'},
                     {:key => 'i', :relation_value => 'usi'}]

    test_patterns.each do |pattern|
      it_behaves_like :yokubon_check, pattern
    end
  end

  describe Junishi, "深水" do
    describe Junishi, "all" do
      shared_examples_for :shinsui_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shinsui?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'hitsuji'},
                       {:key => 'u', :relation_value => 'tora'},
                       {:key => 'uma', :relation_value => 'hitsuji'},
                       {:key => 'tori', :relation_value => 'u'}]

      test_patterns.each do |pattern|
        it_behaves_like :shinsui_check, pattern
      end
    end

    describe Junishi, "支(1)" do
      shared_examples_for :shinsui_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shinsui_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'hitsuji'},
                       {:key => 'u', :relation_value => 'tora'},
                       {:key => 'uma', :relation_value => 'hitsuji'},
                       {:key => 'tori', :relation_value => 'u'}]

      test_patterns.each do |pattern|
        it_behaves_like :shinsui_1_check, pattern
      end
    end

    describe Junishi, "支(2)" do
      shared_examples_for :shinsui_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shinsui_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'usi', :relation_value => 'i'},
                       {:key => 'tatsu', :relation_value => 'saru'},
                       {:key => 'hitsuji', :relation_value => 'hitsuji'},
                       {:key => 'inu', :relation_value => 'tori'}]

      test_patterns.each do |pattern|
        it_behaves_like :shinsui_2_check, pattern
      end
    end
  end

  describe Junishi, "将軍" do
    describe Junishi, "all" do
      shared_examples_for :shogun_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shogun?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'saru'},
                       {:key => 'tora', :relation_value => 'tori'},
                       {:key => 'mi', :relation_value => 'hitsuji'},
                       {:key => 'saru', :relation_value => 'uma'},
                       {:key => 'i', :relation_value => 'saru'}]

      test_patterns.each do |pattern|
        it_behaves_like :shogun_check, pattern
      end
    end

    describe Junishi, "支(1)" do
      shared_examples_for :shogun_1_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shogun_1?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'saru'},
                       {:key => 'tora', :relation_value => 'tori'},
                       {:key => 'mi', :relation_value => 'hitsuji'},
                       {:key => 'saru', :relation_value => 'uma'},
                       {:key => 'i', :relation_value => 'saru'}]

      test_patterns.each do |pattern|
        it_behaves_like :shogun_1_check, pattern
      end
    end

    describe Junishi, "支(2)" do
      shared_examples_for :shogun_2_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shogun_2?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
      end

      test_patterns = [{:key => 'ne', :relation_value => 'i'},
                       {:key => 'tatsu', :relation_value => 'inu'},
                       {:key => 'hitsuji', :relation_value => 'ne'},
                       {:key => 'inu', :relation_value => 'usi'},
                       {:key => 'i', :relation_value => 'i'}]

      test_patterns.each do |pattern|
        it_behaves_like :shogun_2_check, pattern
      end
    end

    describe Junishi, "支(3)" do
      shared_examples_for :shogun_shi_3_check do |params|
        params[:expected_value] = true
        params[:pillar] = MonthPillar

        subject{pillar.shogun_3?(:target_pillar => relation)}
        it_behaves_like :pillar_check_by_junishi_for_junishi, params
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
      end
    end
  end
end

describe "納音" do
  describe "五行" do
    shared_examples_for :gogyo_get do |params|
      let(:expected){Gogyo.by_key(params[:key])}
      let(:pillar){MeishikiPlr.new(:chishi_id => Junishi.by_key(params[:chishi]).id,
                                   :tenkan_id => Jikkan.by_key(params[:tenkan]).id)}

      subject{pillar.nacchin_gogyo}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'kane', :chishi => 'ne', :tenkan => 'kinoe'},
                     {:key => 'kane', :chishi => 'usi', :tenkan => 'kinoto'},
                     {:key => 'hi', :chishi => 'tora', :tenkan => 'hinoe'},
                     {:key => 'hi', :chishi => 'u', :tenkan => 'hinoto'},
                     {:key => 'ki', :chishi => 'tatsu', :tenkan => 'tsuchinoe'},
                     {:key => 'ki', :chishi => 'mi', :tenkan => 'tsuchinoto'},
                     {:key => 'tsuchi', :chishi => 'uma', :tenkan => 'kanoe'},
                     {:key => 'tsuchi', :chishi => 'hitsuji', :tenkan => 'kanoto'},
                     {:key => 'mizu', :chishi => 'i', :tenkan => 'mizunoto'}]

    test_patterns.each do |pattern|
      it_behaves_like :gogyo_get, pattern
    end

  end

end