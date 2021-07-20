class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def initialize(array) 
    if Code.valid_pegs?(array)
      @pegs = array.map { |char| char.upcase }
    else
      raise "Error!"
    end
  end

  def self.valid_pegs?(array)
    array.all? { |char| POSSIBLE_PEGS.keys.include?(char.upcase) }  
  end

  def self.random(num) # 5
    many_pegs = Array.new(num) { POSSIBLE_PEGS.keys }
    pegs = many_pegs.flatten
    random_pegs = pegs.sample(num)
    Code.new(random_pegs)
  end

  def self.from_string(pegs_string) # "GBBYG" if num = 5
    Code.new(pegs_string.split(""))
  end

  def [](index)
    @pegs[index]
  end
  
  def length
    @pegs.length
  end

  def num_exact_matches(guess_arr) 
    count = 0
    
    i = 0
    while i < @pegs.length
      count += 1 if @pegs[i] == guess_arr[i]
      i += 1
    end

    count
  end

  def num_near_matches(guess_arr) # <Code:0x00005654481ce0b0 @pegs=["B", "R", "Y", "Y"]>
    count = 0
    i = 0
    while i < @pegs.length
      count += 1 if @pegs.include?(guess_arr[i]) unless pegs[i] == guess_arr[i]
      i += 1
    end
    
    count
  end

  def ==(code_arr) # <Code:0x00005654481ce0b0 @pegs=["B", "R", "Y", "Y"]>
    self.pegs == code_arr.pegs
  end
  
end