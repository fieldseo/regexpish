require 'test/unit'
require 'lib/regexpish'

# ruby test/tc_update_flag_number.rb

class TestUpdateFlagNumber < Test::Unit::TestCase

# update_flag_number(flag_num, flags)

  EXP_PRAMS  = []
  #
  EXP_PRAMS << [0,    [0, '']    ]  # if 'flags' is anything other than nil the numeric value of the flags is product from 'flags' alone.
  EXP_PRAMS << [1,    [0, 'i']   ]
  EXP_PRAMS << [2,    [0, 'x']   ]
  EXP_PRAMS << [4,    [0, 'm']   ]
  EXP_PRAMS << [3,    [0, 'ix']  ]
  EXP_PRAMS << [5,    [0, 'im']  ]
  EXP_PRAMS << [6,    [0, 'xm']  ]
  EXP_PRAMS << [7,    [0, 'xim'] ]

  EXP_PRAMS << [7,    [nil, 'xim'] ] 
  #
  EXP_PRAMS << [0,    [0, nil]   ] # if 'flags' is not provided or is nil only the 'flag_num' used for the result
  EXP_PRAMS << [0,    [0     ]   ]
  EXP_PRAMS << [1,    [1, nil]   ]
  EXP_PRAMS << [1,    [1     ]   ]
  EXP_PRAMS << [2,    [2, nil]   ]
  EXP_PRAMS << [2,    [2     ]   ]
  EXP_PRAMS << [3,    [3, nil]   ]
  EXP_PRAMS << [3,    [3     ]   ]
  EXP_PRAMS << [4,    [4, nil]   ]
  EXP_PRAMS << [4,    [4     ]   ]
  EXP_PRAMS << [5,    [5, nil]   ]
  EXP_PRAMS << [5,    [5     ]   ]
  EXP_PRAMS << [6,    [6, nil]   ]
  EXP_PRAMS << [6,    [6     ]   ]
  EXP_PRAMS << [7,    [7, nil]   ]
  EXP_PRAMS << [7,    [7     ]   ]
  #
  EXP_PRAMS << [0,    [nil      ]   ] # if 'flag_num' is nil AND if 'flags' is nil result is 0(Zero)
  EXP_PRAMS << [0,    [nil, nil ]   ]
  #
  EXP_PRAMS << [0,    [nil, 0   ]   ] 
  EXP_PRAMS << [1,    [nil, 1   ]   ]  
  EXP_PRAMS << [2,    [nil, 2   ]   ]
  EXP_PRAMS << [4,    [nil, 4   ]   ]
  #
  EXP_PRAMS << [0,    [nil, ''    ]   ] 
  EXP_PRAMS << [1,    [nil, 'i'   ]   ]  
  EXP_PRAMS << [2,    [nil, 'x'   ]   ]
  EXP_PRAMS << [4,    [nil, 'm'   ]   ]

  # Test use of '+' within the 'flags' field.
  EXP_PRAMS << [0,    [0, '+'    ]   ] # a dum noop case
  EXP_PRAMS << [0,    [0, '+ '   ]   ] # a dum noop case
  #
  EXP_PRAMS << [1,    [0, '+i'   ]   ]
  EXP_PRAMS << [2,    [0, '+x'   ]   ]
  EXP_PRAMS << [4,    [0, '+m'   ]   ]
  EXP_PRAMS << [3,    [0, '+ix'   ]   ]
  EXP_PRAMS << [3,    [0, '+xi'   ]   ]
  EXP_PRAMS << [5,    [0, '+mi'   ]   ]
  EXP_PRAMS << [7,    [0, '+xmi'  ]   ]
  #
  EXP_PRAMS << [1,    [1, '+i'   ]   ]
  EXP_PRAMS << [3,    [1, '+x'   ]   ]
  EXP_PRAMS << [5,    [1, '+m'   ]   ]
  EXP_PRAMS << [3,    [2, '+ix'   ]   ]
  EXP_PRAMS << [3,    [2, '+xi'   ]   ]
  EXP_PRAMS << [7,    [2, '+mi'   ]   ]
  EXP_PRAMS << [7,    [7, '+xmi'  ]   ]
  
  # Test use of '-' within the 'flags' field.
  EXP_PRAMS << [0,    [1, '-i'   ]   ]
  EXP_PRAMS << [0,    [2, '-x'   ]   ]
  EXP_PRAMS << [0,    [4, '-m'   ]   ]
  #
  EXP_PRAMS << [2,    [3, '-i'   ]   ]
  EXP_PRAMS << [1,    [3, '-x'   ]   ]
  EXP_PRAMS << [1,    [5, '-m'   ]   ]
  EXP_PRAMS << [3,    [7, '-m'   ]   ]
  #
  EXP_PRAMS << [1,    [1, '-x'   ]   ]
  EXP_PRAMS << [3,    [3, '-m'   ]   ]
  EXP_PRAMS << [2,    [2, '-i'   ]   ]
  EXP_PRAMS << [6,    [6, '-i'   ]   ]  
  #  
  
  EXP_PRAMS << [0,    [2, '-ix'   ]   ]
  EXP_PRAMS << [0,    [2, '-xi'   ]   ]
  EXP_PRAMS << [4,    [5, '-xi'   ]   ]  
  EXP_PRAMS << [4,    [6, '-xi'   ]   ]
  EXP_PRAMS << [4,    [7, '-xi'   ]   ]
  EXP_PRAMS << [2,    [7, '-mi'   ]   ] 
  EXP_PRAMS << [1,    [7, '-mx'   ]   ]   
  #
  EXP_PRAMS << [1,    [1, '-x'   ]   ]
  EXP_PRAMS << [1,    [1, '-m'   ]   ]
  EXP_PRAMS << [0,    [2, '-x'   ]   ]
  EXP_PRAMS << [0,    [4, '-m'   ]   ]
  EXP_PRAMS << [0,    [2, '-ix'   ]   ]
  EXP_PRAMS << [0,    [2, '-xi'   ]   ]
  EXP_PRAMS << [2,    [2, '-mi'   ]   ]
  EXP_PRAMS << [0,    [7, '-xmi'  ]   ] 
  
  def test_update_flag_number
  	EXP_PRAMS.each do |exp, prams|
  		assert_equal(exp, Regexpish.update_flag_number(*prams) , " ... exp==='#{exp.inspect}' \n ... prams='#{prams.inspect}'" )
		end
	end

end

