# coding : utf-8

require 'csv'

module SeedsFromCsv
  # 十二支データ取り込み
  def read_junishi
    _file_path = File.expand_path('db/seeds/junishi.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Junishi.create(:name => row[0], :code => row[1])
    end
  end

  # 十干データ取り込み
  def read_jikkan
    _file_path = File.expand_path('db/seeds/jikkan.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Jikkan.create(:name => row[0], :code => row[1], :shi_teiou => row[2], :inyou => row[3],
                    :point => row[4], :point_day => row[5], :gogyo_id => row[6])
    end
  end

  # 五行データ取り込み
  def read_gogyo
    _file_path = File.expand_path('db/seeds/gogyo.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Gogyo.create(:gogyo_name => row[0], :gogyo_code => row[1])
    end
  end

  # 変通星データ取り込み
  def read_hentsusei
    _file_path = File.expand_path('db/seeds/hentsusei.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Hentsusei.create(:hentsusei_name => row[0], :hentsusei_code => row[1], :category => row[2], :inyou => row[3],
                       :point => row[4])
    end
  end

  # 補運データ取り込み
  def read_houn
    _file_path = File.expand_path('db/seeds/houn.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      Houn.create(:houn_name => row[0], :houn_code => row[1], :point => row[2])
    end
  end

  # 十二支 期間データ取り込み
  def read_junishi_term
    _file_path = File.expand_path('db/seeds/junishi_term.csv', ENV['RAILS_ROOT'])

    CSV.foreach(_file_path, encoding: "UTF-8") do |row|
      JunishiTerm.create(:shi_id => row[0], :term_start => row[1], :term_end => row[2], :zoukan_id => row[3])
    end
  end

  # 天徳データ取り込み
  def read_tentoku
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

