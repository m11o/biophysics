require './lib/maxwell'

group = Maxwell::Group.build
100.times { group.trial }

group.humans.each do |human|
  print human.inspect, "\n"
  print human.record.records, "\n"
  print human.record.records.count, "\n"
end
