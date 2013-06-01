# coding : utf-8

require 'csv'

module SeedsFromCsv

  def read_all_seeds
    read_jikkan()

    read_gogyo()

    read_houn()

    read_hentsusei()

    read_junishi_gogyo

    read_pillar_relation()

    read_pillar_relation_pillar()

    read_zoukan()
  end

  # 十干データ取り込み
  def read_jikkan
    Jikkan.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'jikkans'")

    _file_path = File.expand_path('db/seeds/jikkan.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Jikkan.create(:name => row[0], :code => row[1], :inyou => row[2],
                    :point => row[3], :point_day => row[4], :gogyo_id => row[5])
    end
  end

  # 五行データ取り込み
  def read_gogyo
    Gogyo.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'gogyos'")

    _file_path = File.expand_path('db/seeds/gogyo.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Gogyo.create(:name => row[0], :code => row[1], :angle => row[2])
    end
  end

  # 変通星データ取り込み
  def read_hentsusei
    Hentsusei.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'hentsuseis'")

    _file_path = File.expand_path('db/seeds/hentsusei.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Hentsusei.create(:name => row[0], :code => row[1], :category => row[2], :inyou => row[3],
                       :point => row[4])
    end
  end

  # 補運データ取り込み
  def read_houn
    Houn.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'houns'")

    _file_path = File.expand_path('db/seeds/houn.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Houn.create(:name => row[0], :code => row[1], :point => row[2], :angle => row[3])
    end
  end

  # 十二支　五行データ取り込み
  def read_junishi_gogyo
    JunishiGogyo.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'junishi_gogyos'")

    _file_path = File.expand_path('db/seeds/junishi_gogyo.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      JunishiGogyo.create(:junishi_code => row[0], :gogyo_id => row[1], :point => row[2], :point_month => row[3], :doseishi => row[4])
    end
  end

  # 関連データ取り込み
  def read_pillar_relation
    PillarRelation.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'pillar_relations'")

    _file_path = File.expand_path('db/seeds/pillar_relation.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      PillarRelation.create(:name => row[0], :method_define => row[1])
    end
  end

  # 関連データ取り込み
  def read_pillar_relation_pillar
    PillarRelationPillar.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'pillar_relation_pillars'")

    _file_path = File.expand_path('db/seeds/pillar_relation_pillar.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      PillarRelationPillar.create(:pillar_relation_id => row[0] ,:base_pillar => row[1] ,:target_pillar => row[2] ,:target2_pillar => row[3])
    end
  end

  # 蔵干データ取り込み
  def read_zoukan
    Zoukan.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'zoukans'")

    _file_path = File.expand_path('db/seeds/zoukan.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Zoukan.create(:jikkan_code => row[0], :start_angle => row[1], :span_angle => row[2])
    end
  end

end

