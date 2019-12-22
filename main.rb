require './lib/maxwell'
require 'fileutils'

puts 'ゲームを行う人数を入力してください'
number = gets.chomp.to_i
puts 'コインの数を入力してください'
all_coins_count = gets.chomp.to_i
puts '試行回数を入力してください'
trials_number = gets.chomp.to_i

group = Maxwell::Group.build(number, all_coins_count)
trials_number.times { group.trial }

FileUtils.mkdir_p('./tmp')
now = Time.now
File.open("tmp/result#{now.strftime('%Y%m%d%H%M%S')}.csv", 'w+') do |file|
  file.puts group.build_csv
end
