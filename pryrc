alias :r :require

begin
  require 'awesome_print'
rescue LoadError
else
  AwesomePrint.pry!
end
