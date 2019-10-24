class Array
  def contains_array?(arr)
    self & arr == arr
  end
end
