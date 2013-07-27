# coding : utf-8

require 'spec_helper'
require 'relation_spec_helper'

describe "干学日" do
  describe "五行" do
    shared_examples_for :kangakubi_gogyo_get do |params|
      subject{Gogyo.by_key(key).kangakubi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'tsuchi'},
                     {:key => 'hi', :relation_value => 'hi'},
                     {:key => 'tsuchi', :relation_value => 'tsuchi'},
                     {:key => 'kane', :relation_value => 'kane'},
                     {:key => 'mizu', :relation_value => 'ki'}]

    test_patterns.each do |pattern|
      it_behaves_like :kangakubi_gogyo_get, pattern
    end
  end

  describe "陰陽" do
    shared_examples_for :kangakubi_inyou_get do |params|
      subject{Gogyo.by_key(key).kangakubi_inyou}

      let(:expected){params[:relation_value]}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'ki', :relation_value => -1},
                     {:key => 'hi', :relation_value => 1},
                     {:key => 'tsuchi', :relation_value => 1},
                     {:key => 'kane', :relation_value => -1},
                     {:key => 'mizu', :relation_value => 1}]

    test_patterns.each do |pattern|
      it_behaves_like :kangakubi_inyou_get, pattern
    end
  end

  describe "十干" do
    shared_examples_for :kangakubi_kan_get do |params|
      subject{Gogyo.by_key(key).kangakubi_kan}

      it_behaves_like :relation_get_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'tsuchinoto'},
                     {:key => 'hi', :relation_value => 'hinoe'},
                     {:key => 'tsuchi', :relation_value =>'tsuchinoe'},
                     {:key => 'kane', :relation_value => 'kanoto'},
                     {:key => 'mizu', :relation_value => 'kinoe'}]

    test_patterns.each do |pattern|
      it_behaves_like :kangakubi_kan_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :kangakubi_shi_get do |params|
      subject{Gogyo.by_key(key).kangakubi_shi}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'i'},
                     {:key => 'hi', :relation_value => 'tora'},
                     {:key => 'tsuchi', :relation_value =>'saru'},
                     {:key => 'kane', :relation_value => 'mi'},
                     {:key => 'mizu', :relation_value => 'saru'}]

    test_patterns.each do |pattern|
      it_behaves_like :kangakubi_shi_get, pattern
    end
  end

end

describe "正綬日" do
  describe "五行" do
    shared_examples_for :seijubi_gogyo_get do |params|
      subject{Gogyo.by_key(key).seijubi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'mizu'},
                     {:key => 'hi', :relation_value => 'ki'},
                     {:key => 'tsuchi', :relation_value => 'hi'},
                     {:key => 'kane', :relation_value => 'ki'},
                     {:key => 'mizu', :relation_value => 'mizu'}]

    test_patterns.each do |pattern|
      it_behaves_like :seijubi_gogyo_get, pattern
    end
  end

  describe "陰陽" do
    shared_examples_for :seijubi_inyou_get do |params|
      subject{Gogyo.by_key(key).seijubi_inyou}

      let(:expected){params[:relation_value]}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'ki', :relation_value => -1},
                     {:key => 'hi', :relation_value => 1},
                     {:key => 'tsuchi', :relation_value => 1},
                     {:key => 'kane', :relation_value => -1},
                     {:key => 'mizu', :relation_value => 1}]

    test_patterns.each do |pattern|
      it_behaves_like :seijubi_inyou_get, pattern
    end
  end

  describe "十干" do
    shared_examples_for :seijubi_kan_get do |params|
      subject{Gogyo.by_key(key).seijubi_kan}

      it_behaves_like :relation_get_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'mizunoto'},
                     {:key => 'hi', :relation_value => 'kinoe'},
                     {:key => 'tsuchi', :relation_value =>'hinoe'},
                     {:key => 'kane', :relation_value => 'kinoto'},
                     {:key => 'mizu', :relation_value => 'mizunoe'}]

    test_patterns.each do |pattern|
      it_behaves_like :seijubi_kan_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :seijubi_shi_get do |params|
      subject{Gogyo.by_key(key).seijubi_shi}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hitsuji'},
                     {:key => 'hi', :relation_value => 'inu'},
                     {:key => 'tsuchi', :relation_value =>'tatsu'},
                     {:key => 'kane', :relation_value => 'usi'},
                     {:key => 'mizu', :relation_value => 'tatsu'}]

    test_patterns.each do |pattern|
      it_behaves_like :seijubi_shi_get, pattern
    end
  end
end

describe "財庫日" do
  describe "五行" do
    shared_examples_for :zaikobi_gogyo_get do |params|
      subject{Gogyo.by_key(key).zaikobi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hi'},
                     {:key => 'hi', :relation_value => 'ki'},
                     {:key => 'tsuchi', :relation_value => 'mizu'},
                     {:key => 'kane', :relation_value => 'mizu'},
                     {:key => 'mizu', :relation_value => 'ki'}]

    test_patterns.each do |pattern|
      it_behaves_like :zaikobi_gogyo_get, pattern
    end
  end

  describe "陰陽" do
    shared_examples_for :zaikobi_inyou_get do |params|
      subject{Gogyo.by_key(key).zaikobi_inyou}

      let(:expected){params[:relation_value]}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 1},
                     {:key => 'hi', :relation_value => -1},
                     {:key => 'tsuchi', :relation_value => 1},
                     {:key => 'kane', :relation_value => -1},
                     {:key => 'mizu', :relation_value => 1}]

    test_patterns.each do |pattern|
      it_behaves_like :zaikobi_inyou_get, pattern
    end
  end

  describe "十干" do
    shared_examples_for :zaikobi_kan_get do |params|
      subject{Gogyo.by_key(key).zaikobi_kan}

      it_behaves_like :relation_get_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hinoe'},
                     {:key => 'hi', :relation_value => 'kinoto'},
                     {:key => 'tsuchi', :relation_value =>'mizunoe'},
                     {:key => 'kane', :relation_value => 'mizunoto'},
                     {:key => 'mizu', :relation_value => 'kinoe'}]

    test_patterns.each do |pattern|
      it_behaves_like :zaikobi_kan_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :zaikobi_shi_get do |params|
      subject{Gogyo.by_key(key).zaikobi_shi}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'kane', :relation_value => 'hitsuji'},
                     {:key => 'mizu', :relation_value => 'inu'},
                     {:key => 'ki', :relation_value =>'tatsu'},
                     {:key => 'hi', :relation_value => 'usi'},
                     {:key => 'tsuchi', :relation_value => 'tatsu'}]

    test_patterns.each do |pattern|
      it_behaves_like :zaikobi_shi_get, pattern
    end
  end
end

describe "正桃華日" do
  describe "十干" do
    shared_examples_for :seitoukajitsu_kan_check do |params|
      subject{Gogyo.by_key(key).seitoukajitsu_kan?(relation)}
      params[:expected_value] = true unless params.key?(:expected_value)

      it_behaves_like :relation_check_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hinoe'},
                     {:key => 'hi', :relation_value => 'kinoto'},
                     {:key => 'tsuchi', :relation_value =>'tsuchinoe'},
                     {:key => 'tsuchi', :relation_value =>'tsuchinoto', :expected_value => false},
                     {:key => 'kane', :relation_value => 'tsuchinoto'},
                     {:key => 'mizu', :relation_value => 'kinoe'}]

    test_patterns.each do |pattern|
      it_behaves_like :seitoukajitsu_kan_check, pattern
    end
  end


  describe "十二支_1" do
    shared_examples_for :seitoukajitsu_shi_1_get do |params|
      subject{Gogyo.by_key(key).seitoukajitsu_shi_1}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'u'},
                     {:key => 'hi', :relation_value => 'uma'},
                     {:key => 'tsuchi', :relation_value =>'uma'},
                     {:key => 'kane', :relation_value => 'tori'},
                     {:key => 'mizu', :relation_value => 'ne'}]

    test_patterns.each do |pattern|
      it_behaves_like :seitoukajitsu_shi_1_get, pattern
    end
  end

  describe "十二支_2" do
    shared_examples_for :seitoukajitsu_shi_2_get do |params|
      subject{Gogyo.by_key(key).seitoukajitsu_shi_2}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'i'},
                     {:key => 'hi', :relation_value => 'inu'},
                     {:key => 'tsuchi', :relation_value =>'uma'},
                     {:key => 'kane', :relation_value => 'tori'},
                     {:key => 'mizu', :relation_value => 'saru'}]

    test_patterns.each do |pattern|
      it_behaves_like :seitoukajitsu_shi_2_get, pattern
    end
  end
end

describe "呻吟日" do
  describe "五行" do
    shared_examples_for :singinbi_gogyo_get do |params|
      subject{Gogyo.by_key(key).singinbi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hi'},
                     {:key => 'hi', :relation_value => 'tsuchi'},
                     {:key => 'tsuchi', :relation_value => 'tsuchi'},
                     {:key => 'kane', :relation_value => 'kane'},
                     {:key => 'mizu', :relation_value => 'tsuchi'}]

    test_patterns.each do |pattern|
      it_behaves_like :singinbi_gogyo_get, pattern
    end
  end

  describe "陰陽" do
    shared_examples_for :singinbi_inyou_get do |params|
      subject{Gogyo.by_key(key).singinbi_inyou}

      let(:expected){params[:relation_value]}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 1},
                     {:key => 'hi', :relation_value => -1},
                     {:key => 'tsuchi', :relation_value => 1},
                     {:key => 'kane', :relation_value => -1},
                     {:key => 'mizu', :relation_value => -1}]

    test_patterns.each do |pattern|
      it_behaves_like :singinbi_inyou_get, pattern
    end
  end

  describe "十干" do
    shared_examples_for :singinbi_kan_get do |params|
      subject{Gogyo.by_key(key).singinbi_kan}

      it_behaves_like :relation_get_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hinoe'},
                     {:key => 'hi', :relation_value => 'tsuchinoto'},
                     {:key => 'tsuchi', :relation_value =>'tsuchinoe'},
                     {:key => 'kane', :relation_value => 'kanoto'},
                     {:key => 'mizu', :relation_value => 'tsuchinoto'}]

    test_patterns.each do |pattern|
      it_behaves_like :singinbi_kan_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :singinbi_shi_get do |params|
      subject{Gogyo.by_key(key).singinbi_shi}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'tora'},
                     {:key => 'hi', :relation_value => 'mi'},
                     {:key => 'tsuchi', :relation_value =>'saru'},
                     {:key => 'kane', :relation_value => 'i'},
                     {:key => 'mizu', :relation_value => 'mi'}]

    test_patterns.each do |pattern|
      it_behaves_like :singinbi_shi_get, pattern
    end
  end
end

describe "妨害日" do
  describe "十二支" do
    shared_examples_for :bougaibi_shi_1_get do |params|
      subject{Gogyo.by_key(key).bougaibi_shi_1}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'ne'},
                     {:key => 'hi', :relation_value => 'u'},
                     {:key => 'tsuchi', :relation_value =>'tori'},
                     {:key => 'kane', :relation_value => 'uma'},
                     {:key => 'mizu', :relation_value => 'tori'}]

    test_patterns.each do |pattern|
      it_behaves_like :bougaibi_shi_1_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :bougaibi_shi_2_get do |params|
      subject{Gogyo.by_key(key).bougaibi_shi_2}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'usi'},
                     {:key => 'hi', :relation_value => 'tora'},
                     {:key => 'tsuchi', :relation_value =>'inu'},
                     {:key => 'kane', :relation_value => 'hitsuji'},
                     {:key => 'mizu', :relation_value => 'inu'}]

    test_patterns.each do |pattern|
      it_behaves_like :bougaibi_shi_2_get, pattern
    end
  end
end

describe "鬼限日" do
  describe "五行" do
    shared_examples_for :kigenbi_gogyo_get do |params|
      subject{Gogyo.by_key(key).kigenbi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'ki'},
                     {:key => 'hi', :relation_value => 'hi'},
                     {:key => 'tsuchi', :relation_value => 'tsuchi'},
                     {:key => 'kane', :relation_value => 'kane'},
                     {:key => 'mizu', :relation_value => 'mizu'}]

    test_patterns.each do |pattern|
      it_behaves_like :kigenbi_gogyo_get, pattern
    end
  end

  describe "陰陽" do
    shared_examples_for :kigenbi_inyou_get do |params|
      subject{Gogyo.by_key(key).kigenbi_inyou}

      let(:expected){params[:relation_value]}
      it_behaves_like :relation_get, params
    end

    test_patterns = [{:key => 'ki', :relation_value => -1},
                     {:key => 'hi', :relation_value => -1},
                     {:key => 'tsuchi', :relation_value => -1},
                     {:key => 'kane', :relation_value => 1},
                     {:key => 'mizu', :relation_value => -1}]

    test_patterns.each do |pattern|
      it_behaves_like :kigenbi_inyou_get, pattern
    end
  end

  describe "十干" do
    shared_examples_for :kigenbi_kan_get do |params|
      subject{Gogyo.by_key(key).kigenbi_kan}

      it_behaves_like :relation_get_for_jikkan, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'kinoto'},
                     {:key => 'hi', :relation_value => 'hinoto'},
                     {:key => 'tsuchi', :relation_value =>'tsuchinoto'},
                     {:key => 'kane', :relation_value => 'kanoe'},
                     {:key => 'mizu', :relation_value => 'mizunoto'}]

    test_patterns.each do |pattern|
      it_behaves_like :kigenbi_kan_get, pattern
    end
  end

  describe "十二支" do
    shared_examples_for :kigenbi_shi_get do |params|
      subject{Gogyo.by_key(key).kigenbi_shi}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'u'},
                     {:key => 'hi', :relation_value => 'usi'},
                     {:key => 'tsuchi', :relation_value =>'i'},
                     {:key => 'kane', :relation_value => 'uma'},
                     {:key => 'mizu', :relation_value => 'tori'}]

    test_patterns.each do |pattern|
      it_behaves_like :kigenbi_shi_get, pattern
    end
  end
end

describe "陽錯日" do
  describe "五行" do
    shared_examples_for :yousakubi_gogyo_get do |params|
      subject{Gogyo.by_key(key).yousakubi_gogyo}
      it_behaves_like :relation_get_for_gogyo, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'hi'},
                     {:key => 'hi', :relation_value => 'hi'},
                     {:key => 'tsuchi', :relation_value => 'tsuchi'},
                     {:key => 'kane', :relation_value => 'mizu'},
                     {:key => 'mizu', :relation_value => 'mizu'}]

    test_patterns.each do |pattern|
      it_behaves_like :yousakubi_gogyo_get, pattern
    end
  end

  describe "十二支_1" do
    shared_examples_for :yousakubi_shi_1_get do |params|
      subject{Gogyo.by_key(key).yousakubi_shi_1}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => 'saru'},
                     {:key => 'hi', :relation_value => 'ne'},
                     {:key => 'tsuchi', :relation_value =>'tora'},
                     {:key => 'kane', :relation_value => 'inu'},
                     {:key => 'mizu', :relation_value => 'tatsu'}]

    test_patterns.each do |pattern|
      it_behaves_like :yousakubi_shi_1_get, pattern
    end
  end

  describe "十二支_2" do
    shared_examples_for :yousakubi_shi_2_get do |params|
      subject{Gogyo.by_key(key).yousakubi_shi_2}

      it_behaves_like :relation_get_for_junishi, params
    end

    test_patterns = [{:key => 'ki', :relation_value => nil},
                     {:key => 'hi', :relation_value => nil},
                     {:key => 'tsuchi', :relation_value => nil},
                     {:key => 'kane', :relation_value => nil},
                     {:key => 'mizu', :relation_value => 'inu'}]

    test_patterns.each do |pattern|
      it_behaves_like :yousakubi_shi_2_get, pattern
    end
  end
end
