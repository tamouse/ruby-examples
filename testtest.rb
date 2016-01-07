#assert_equal ->

  if (item1 == item2)
    return true
  end

#refute_match ->

if ! (item1).match(item2)
  return true
end
