# coding : utf-8

require 'csv'

module SeedsFromCsv
  # 十二支データ取り込み
  def read_junishi
    Junishi.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'junishis'")

    _file_path = File.expand_path('db/seeds/junishi.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Junishi.create(:name => row[0], :code => row[1], :angle => row[2])
    end
  end

  # 十干データ取り込み
  def read_jikkan
    Jikkan.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'jikkans'")

    _file_path = File.expand_path('db/seeds/jikkan.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Jikkan.create(:name => row[0], :code => row[1], :shi_teiou => row[2], :inyou => row[3],
                    :point => row[4], :point_day => row[5], :gogyo_id => row[6])
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

  # 十二支 期間データ取り込み
  def read_junishi_term
    JunishiTerm.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'junishi_terms'")

    _file_path = File.expand_path('db/seeds/junishi_term.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      JunishiTerm.create(:shi_id => row[0], :term_start => row[1], :term_end => row[2], :zoukan_id => row[3])
    end
  end

  # 十二支　五行データ取り込み
  def read_junishi_gogyo
    JunishiGogyo.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'junishi_gogyos'")

    _file_path = File.expand_path('db/seeds/junishi_gogyo.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      JunishiGogyo.create(:junishi_term_id => row[0], :gogyo_id => row[1], :point => row[2], :point_month => row[3])
    end
  end

  # 天徳データ取り込み
  def read_tentoku
    Tentoku.destroy_all
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = 'junishi_tentokus'")

    _file_path = File.expand_path('db/seeds/tentoku.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      if row[2] == "TentokuKan"
        TentokuKan.create(:shi_id => row[0], :tentoku => row[1])
      else
        TentokuShi.create(:shi_id => row[0], :tentoku => row[1])
      end
    end
  end
end

