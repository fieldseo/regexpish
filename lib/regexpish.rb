module Regexpish

  def self.update_flag_number(flag_num=0, flags=nil)
  	flag_num = 0 unless Numeric === flag_num
    return flags     if Numeric === flags     # if flags is Numeric we are "setting" the "flag options".
    return flag_num  if flags.nil?            # if flags is nil, then we are keeping the current "flag options", ie. not changing anything
    flags    = flags.to_s.strip.downcase     # making sure we have a string with any spaces removed.
    return 0 if flags == ''                  # if flags is '' then we are setting "flag options" to 0 (Zero)
    flags    =~ /([+-=]?)(.*)/               # detrmine if we are "setting" or "changing" the "flag options".
    data     = Regexp.last_match             #    ... if changing are we adding(+) or removing(-) "flag options""
    sign     = data[1]
    flags    = data[2]
    flag_num = 0 if (sign=='' || sign=='=')  # we are "setting" the flag option number Not "changing" it from a previous value.
    if sign=='-'
      flag_num &= ~Regexp::IGNORECASE if flags.include?('i') # "-i", "+imx", "+mi", "+im", "+xi" ...etx.
      flag_num &= ~Regexp::MULTILINE  if flags.include?('m') # this will remove any "flag option" in the "flags" string
      flag_num &= ~Regexp::EXTENDED   if flags.include?('x')
    else
      flag_num |= Regexp::IGNORECASE if flags.include?('i')  # "i", "xi", "mix" ... "+i", "+xi", "+mxi" ...etc.
      flag_num |= Regexp::MULTILINE  if flags.include?('m')  # this will add any "flag option" in the "flags" string
      flag_num |= Regexp::EXTENDED   if flags.include?('x')
    end
    flag_num
  end

  def self.regexp( thing, options={} )
    regexp_form           = options[:regexp_form]          ||  /(?:re:\s*)?\/(.*)\/([i|x|m]*)/i
    regexp_pattern_index  = options[:regexp_pattern_index] || 1
    regexp_flags_index    = options[:regexp_flags_index]   || 2
    flags                 = options[:flags]                || nil
    
    case thing
    when Regexp then
      return thing if flags.nil?                     # if flags is nil we don't change the current regexp.
      flag_num = thing.options                       # this is the current "flag options" as a number. (".options" is a Regexp method)
      flag_num = update_flag_number(flag_num, flags) # updated "flag options" in number form.
      return Regexp.new( thing.source, flag_num )
    when String then
    	regexp_form_match = (Regexp === regexp_form) ? regexp_form : /#{regexp_form}/i
      #puts regexp_form_match.inspect
      if (thing =~ regexp_form_match)
        data        = Regexp.last_match
        pattern     = data[regexp_pattern_index]
        # p data[1]
        # p data[2]
        # p data[3]
        # p regexp_flags_index
        # puts "data[regexp_flags_index]=#{data[regexp_flags_index].inspect}"
        flag_string = (regexp_flags_index <= -1) ? nil : data[regexp_flags_index] # current "flag options" as a string
        flag_num    = update_flag_number(0, flag_string)                          # current "flag options" as a number
        flag_num    = update_flag_number(flag_num, flags)                         # update "flag options" based on current value and the "flags" option
        return Regexp.new( pattern, flag_num )
      else
        return nil # if "thing" does not match with regexp_form_match is is an error so we pass back nil
      end
    else
      flag_number = update_flag_number(0, flags) # thing is not a String or Regexp so there is no current "flag options" info so it is really '0'(Zero)
      return Regexp.new( thing.to_s, flag_number )
    end
  end
  
end




