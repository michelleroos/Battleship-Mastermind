require_relative "./code.rb"

class Mastermind

    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code_instance) #<Code:0x0000562ea877eea8 @pegs=["Y", "Y", "Y", "G"]> 
        puts "Exact Matches: #{@secret_code.num_exact_matches(code_instance)}" 
        puts "Near Matches: #{@secret_code.num_near_matches(code_instance)}"
    end

    def ask_user_for_guess
        puts "Enter a code" # "RGBG/n"
        pegs_string = gets.chomp # "RGBG"
        print_matches(Code.from_string(pegs_string)) #Code.new
        pegs_string.split("") == @secret_code.pegs
        #if pegs_string == @secretcode
        # "RGBG" == <Code:0x0000562ea877eea8 @pegs=["Y", "Y", "Y", "G"]> 
        # [R, G, B, G] == 
    end
end
