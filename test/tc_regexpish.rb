require 'test/unit'
require 'lib/regexpish'

# ruby test/tc_regexpish.rb

class TestRegexpish < Test::Unit::TestCase

#	    regexp_form           = options[:regexp_form]          || "re:\s*\/(.*)\/([i|x|m]*)"
#	    regexp_pattern_index  = options[:regexp_pattern_index] || 1
#	    regexp_flags_index    = options[:regexp_flags_index]   || 2
#	    flags                 = options[:flags]                || nil

  options = {}
  EXP_PRAMS  = []
  EXP_PRAMS << [/abc/i,           ['re: /abc/i']       ]
  EXP_PRAMS << [/abc/ix,          [' re:   /abc/ix ']  ]
  EXP_PRAMS << [/abc/,            ["re: /abc/"]        ]
  EXP_PRAMS << [/abc/m,           [" RE:/abc/m "]      ]
  EXP_PRAMS << [/abc/,            ["RE: /abc/"]        ]
  EXP_PRAMS << [/abc/x,           ["/abc/x", options]  ]
  EXP_PRAMS << [/abc/i,           ["/abc/i"]           ]
  EXP_PRAMS << [/abc/,            ["/abc/"]            ]
  EXP_PRAMS << [/abc/,            ["/abc/ ", options]  ]
  EXP_PRAMS << [/abc/,            [" /abc/"]           ]
  EXP_PRAMS << [/abc/ix,          ["/abc/ix", options] ]
  EXP_PRAMS << [/abc/x,           ["/abc/X", options]  ]
  EXP_PRAMS << [/abc/x,           ["Re:/abc/x"]        ]
  EXP_PRAMS << [/abc/ixm,         ["rE: /abc/IxM"]     ]
  #
  options = { :regexp_form => /(.*)/ }
  EXP_PRAMS << [/abc/,           ['abc', options]      ]
  EXP_PRAMS << [/ abc /,         [' abc ', options]    ]
  #
  options = { :regexp_form => /\A\s*(.*?)\s*\Z/ }
  EXP_PRAMS << [/abc/,           ['abc', options]      ]
  EXP_PRAMS << [/abc/,           [' abc ', options]    ]

  # passing in the :regexp_form as a string. 
  options = { :regexp_form => '\/(.*)\/([i|x|m]*)' }
  EXP_PRAMS << [/abc/i,           ['re: /abc/i',      options] ]
  EXP_PRAMS << [/abc/ix,          [' re:   /abc/ix ', options] ]
  EXP_PRAMS << [/abc/,            ["re: /abc/",       options] ]
  EXP_PRAMS << [/abc/m,           [" RE:/abc/m ",     options] ]
  EXP_PRAMS << [/abc/,            ["RE: /abc/",       options] ]
  EXP_PRAMS << [/abc/x,           ["/abc/x",          options] ]
  EXP_PRAMS << [/abc/i,           ["/abc/i",          options] ]
  EXP_PRAMS << [/abc/,            ["/abc/",           options] ]
  EXP_PRAMS << [/abc/,            ["/abc/ ",          options] ]
  EXP_PRAMS << [/abc/,            [" /abc/",          options] ]
  EXP_PRAMS << [/abc/ix,          ["/abc/ix",         options] ]
  EXP_PRAMS << [/abc/x,           ["/abc/X",          options] ]
  EXP_PRAMS << [/abc/x,           ["Re:/abc/x",       options] ]
  EXP_PRAMS << [/abc/ixm,         ["rE: /abc/IxM",    options] ]
  
  # passing in the :regexp_form as a string. 
  options = { :regexp_form => '\A\s*(?:re:)?\s*/(.*)/([i|x|m]*)' }
  EXP_PRAMS << [/abc/i,           ['re: /abc/i',      options] ]
  EXP_PRAMS << [/abc/ix,          [' re:   /abc/ix ', options] ]
  EXP_PRAMS << [/abc/,            ["re: /abc/",       options] ]
  EXP_PRAMS << [/abc/m,           [" RE:/abc/m ",     options] ]
  EXP_PRAMS << [/abc/,            ["RE: /abc/",       options] ]
  EXP_PRAMS << [/abc/x,           ["/abc/x",          options] ]
  EXP_PRAMS << [/abc/i,           ["/abc/i",          options] ]
  EXP_PRAMS << [/abc/,            ["/abc/",           options] ]
  EXP_PRAMS << [/abc/,            ["/abc/ ",          options] ]
  EXP_PRAMS << [/abc/,            [" /abc/",          options] ]
  EXP_PRAMS << [/abc/ix,          ["/abc/ix",         options] ]
  EXP_PRAMS << [/abc/x,           ["/abc/X",          options] ]
  EXP_PRAMS << [/abc/x,           ["Re:/abc/x",       options] ]
  EXP_PRAMS << [/abc/ixm,         ["rE: /abc/IxM",    options] ]

  #       Regexpish.regexp("(?-mix:abc)", options)  ==> /abc/
  #       Regexpish.regexp("(?i-mx:abc)", options)  ==> /abc/i
  #       Regexpish.regexp("(?m-ix:abc)", options)  ==> /abc/m
  #       Regexpish.regexp("(?x-mi:abc)", options)  ==> /abc/x
  #       Regexpish.regexp("(?ix-m:abc)", options)  ==> /abc/ix
  #       Regexpish.regexp("(?mix:abc)",  options)  ==> /abc/mix

  # "(?mx-i:somepattern)"
  # :regexp_form=>/\(\?([i|x|m]*)-?(:?[i|x|m]*):(.*)\)/,
  options = { :regexp_form=>/\(\?([i|x|m]*)-?(?:[i|x|m]*):(.*)\)/,
              :regexp_pattern_index=> 2, 
              :regexp_flags_index  => 1  }
  options = { :regexp_form=>"\\(\\?([i|x|m]*)-?(?:[i|x|m]*):(.*)\\)",
              :regexp_pattern_index=> 2, 
              :regexp_flags_index  => 1  }
  options = { :regexp_form=>'\(\?([i|x|m]*)-?(?:[i|x|m]*):(.*)\)',
              :regexp_pattern_index=> 2, 
              :regexp_flags_index  => 1  }
  options = { :regexp_form=>'\(\?([i|x|m]*)-?([i|x|m]*):(.*)\)',
              :regexp_pattern_index=> 3, 
              :regexp_flags_index  => 1  }                                         
  EXP_PRAMS << [/abc/,          ["(?-mix:abc)",    options] ]
  EXP_PRAMS << [/abc/i,         ["(?i-mx:abc)",    options] ]
  EXP_PRAMS << [/abc/m,         ["(?m-ix:abc)",    options] ]
  EXP_PRAMS << [/abc/x,         ["(?x-mi:abc)",    options] ]
  EXP_PRAMS << [/abc/ix,        ["(?ix-m:abc)",    options] ]
  EXP_PRAMS << [/abc/mix,       ["(?mix:abc)",     options] ]

  def test_regexpish
    EXP_PRAMS.each do |exp, prams|
      puts "prams=#{prams.inspect}"
      assert_equal(exp, Regexpish.regexp( *prams ) , "exp='#{exp.inspect}' ... prams='#{prams.inspect}'" )
    end
  end

end

