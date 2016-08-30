# this is not ready to go
def self.check_input(word)
  if word =~ /^[a-zA-Z]+$/
  return word
  else
   raise ArgumentError
  end
end
