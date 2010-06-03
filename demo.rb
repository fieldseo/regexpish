  puts "--------------------------------------------"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  regexp_str = '/(.*)/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"  
  regexp_str = '\/(.*)\/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"  
  regexp_str = '\\/(.*)\\/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"  
  regexp_str = '\\\/(.*)\\\/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  puts "--------------------------------------------"  
  regexp_str = "/(.*)/([i|x|m]*)"
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"  
  regexp_str = "\/(.*)\/([i|x|m]*)"
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"  
  regexp_str = "\\/(.*)\\/([i|x|m]*)"
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  regexp_str = '(?:re:)?\s*/(.*)/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  regexp_str = '(?:re:)?\s*/(.*)/([i|x|m]*)'
  regexp_lit = /#{regexp_str}/
  puts "regexp_test ... #{regexp_str.inspect} ... #{regexp_lit.inspect}"
  #    
  regexp_esc = Regexp.escape(regexp_str)
  p regexp_esc
  regexp_lit = /#{regexp_esc}/
  puts "regexp_esc ... #{regexp_esc.inspect} ... #{regexp_lit.inspect}"
  puts "--------------------------------------------"
  puts "--------------------------------------------"
  puts "--------------------------------------------"