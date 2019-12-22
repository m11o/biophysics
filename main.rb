require './lib/maxwell'
require 'fileutils'

group = Maxwell::Group.build
100.times { group.trial }

FileUtils.mkdir_p('./tmp')
now = Time.now
File.open("tmp/result#{now.strftime('%Y%m%d%H%M%S')}.csv", 'w+') do |file|
  file.puts group.build_csv
end


