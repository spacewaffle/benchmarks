require 'benchmark'

index = 0
small_array = ["blah"]
small_hash = { 1 => "blah"}

large_array = (1..1000000).to_a.map{|x| x.to_s}

large_hash = {}
1000000.times {|n| large_hash[n]=n.to_s}

n = 50000
Benchmark.bmbm() do |x|
  x.report("small_array: ")   { 1000000.times do small_array.index('blah') end}
  x.report("small_hash: ")    { 1000000.times do small_hash.key('blah') end }
  x.report("large_array close value: ")   { 1000000.times do large_array.index('25') end}
  x.report("large_hash close value: ")    { 1000000.times do large_hash.key('25') end }
  x.report("large_array far value: ")   { 100.times do large_array.index('750000') end}
  x.report("large_hash far value: ")    { 100.times do large_hash.key('750000') end }
end