# caesar_cipher_encrypt.rb
#
def caesar_cipher_encrypt(phrase, offset)
  conv_phrase = phrase.split('').collect { |letter| letter.ord - 65 }
  conv_phrase.collect! do |ordinal|
    if ordinal.between?(0,26) # uppercase letters
      (((ordinal + offset.abs) % 26) + 65).chr
    elsif ordinal.between?(32,58) # lowercase letters
      temp = (((ordinal + offset.abs) % 58) + 65)
      temp <= 90 ? (temp += 32).chr : temp.chr
    else
      (ordinal + 65).chr # retain all other characters
    end
  end
  conv_phrase.join
end

def caesar_cipher_decrypt(phrase, offset)
  conv_cipher = phrase.split('').collect { |letter| letter.ord - 65 }
  conv_cipher.collect! do |ordinal|
    if ordinal.between?(0,26) # uppercase letters
      (((ordinal - offset.abs) % 26) + 65).chr
    elsif ordinal.between?(32,58) # lowercase letters
      temp = (((ordinal - offset.abs) % 58) + 65)
      temp <= 96 ? (temp += 26).chr : temp.chr
    else
      (ordinal + 65).chr # retain all other characters
    end
  end
  conv_cipher.join
end

puts caesar_cipher_encrypt("What a string!", 5)
# -> Bmfy f xywnsl!
puts caesar_cipher_encrypt("wHAT A STRING!", 5)
# -> bMFY F XYWNSL!
puts caesar_cipher_decrypt("Bmfy f xywnsl!", 5)
# -> What a string!
puts caesar_cipher_decrypt("bMFY F XYWNSL!", 5)
# -> wHAT A STRING!
puts caesar_cipher_encrypt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 25)
# -> ZABCDEFGHIJKLMNOPQRSTUVWXYzabcdefghijklmnopqrstuvwxy
puts caesar_cipher_decrypt("ZABCDEFGHIJKLMNOPQRSTUVWXYzabcdefghijklmnopqrstuvwxy", 25)
# -> ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
puts caesar_cipher_encrypt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 1)
# -> BCDEFGHIJKLMNOPQRSTUVWXYZAbcdefghijklmnopqrstuvwxyza
puts caesar_cipher_decrypt("BCDEFGHIJKLMNOPQRSTUVWXYZAbcdefghijklmnopqrstuvwxyza", 1)
# -> ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
puts caesar_cipher_encrypt("All the King's horses and all the King's men!", 15)
# -> Paa iwt Zxcv'h wdghth pcs paa iwt Zxcv'h btc!
puts caesar_cipher_decrypt("Paa iwt Zxcv'h wdghth pcs paa iwt Zxcv'h btc!", 15)
# -> All the King's horses and all the King's men!
