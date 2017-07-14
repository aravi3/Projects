def anagram?(word1, word2)
  perms = word1.chars.permutation.to_a
  return true if perms.include?(word2.chars)
  false
end

def second_anagram?(word1, word2)
  word1 = word1.dup
  word2 = word2.dup

  until word1.empty? || word2.empty?
    return false unless word2.include?(word1[0])
    word2.slice!(word2.index(word1[0]))
    word1 = word1[1..-1]
  end

  word1.empty? && word2.empty?
end

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  hsh = Hash.new(0)
  word1.each_char { |a| hsh[a] += 1 }
  word2.each_char { |a| hsh[a] -= 1 }
  hsh.values.all?(&:zero?)
end





p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
