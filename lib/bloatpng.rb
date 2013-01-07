require 'digest/crc32'
require 'securerandom'

class BloatPNG

  # "Bloats" a PNG file by adding random
  # data in the form of text elements
  def self.bloat(input, output, size=256)
    if(size < 20)
      raise NeedsMoreBloatException
    end
    n = size - 32 - Math.log2(size).to_i
    key = SecureRandom.hex(15)
    text = SecureRandom.hex(n)[1..n]
    self.insert_text_element(input, output, key, text)
  end

  private

  # see: http://www.w3.org/TR/PNG/#11tEXt
  def self.insert_text_element(input_file, output_file, key, text)
    png = ""
    File.open(input_file, 'rb') do |f|
      png = f.read
    end
    chunk = create_text_element(key, text)
    File.open(output_file, 'wb') do |f|
      f.write(add_chunk_to_png(chunk, png))
    end
  end

  def self.create_text_element(key, text)
    raise KeySizeError if key.length > 79
    chunk_type = "tEXt"
    chunk_data = key.gsub("\0", " ") + "\0" + text.gsub("\0", " ") # null-separated
    crc = [Digest::CRC32.checksum(chunk_type + chunk_data)].pack('N')
    len = [chunk_data.length].pack('N')
    return len + chunk_type + chunk_data + crc
  end

  def self.add_chunk_to_png(chunk, png)
    len = png.length
    return png[0,len-12] + chunk + png[len-12,12]
  end
end
