class OurHashMap
  def initialize

    @values = []
  end

  def get(key)
    i = @keys.index(key)
    @values[i.hash]
  end

  def put(key, value)
    @values[key.hash % @values.size] = value

  end

end


hash = OurHashMap.new

hash.put("first_name", "Nick")
puts "Nick" == hash.get("first_name")