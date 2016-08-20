require 'byebug'

class OurHashMap
  attr_accessor :hash_arr, :hash_size

  def initialize
    @hash_arr = []
    @hash_size = 11
  end

  def put(key, value)
    if increase_size?
      resize_hash
      rehash
    end

    insert(key, value)
  end

  def get(key)
    i = index(key)
    hash_arr[i].last
  end

  private

    def index(key)
      key.hash % hash_size
    end

    def increase_size?
      hash_size / 2 == hash_arr.compact.count / 2
    end

    def resize_hash
      hash_size *= 2
    end

    def insert(key, value)
      i = index(key)
      hash_arr[i] = [key, value]
    end

    def rehash
      hash_arr.compact.each do |key, value|
        insert(key, value)
      end
    end
end


hash = OurHashMap.new

hash.put("first_name", "Nick")
puts "Nick" == hash.get("first_name")
