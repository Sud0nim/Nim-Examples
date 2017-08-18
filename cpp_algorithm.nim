
# TODO: add openarray type and int for each

let v = @[1.0,2.0,3.0,3.0,3.0]

#[ Implementations as I would prefer them (not direct translations from C++) ]#

# Find algorithms

template find*(sequence, search_for: untyped): int =
  var result = 0
  for it {.inject.} in items(sequence):
    if it == search_for:
      break
    inc result
  result

template find_if*(sequence, search_for: untyped): int =
  var result = 0
  for it {.inject.} in items(sequence):
    if search_for:
      break
    inc result
  result
  
template find_if_not*(sequence, search_for: untyped): int =
  var result = 0
  for it {.inject.} in items(sequence):
    if search_for == false:
      break
    inc result
  result

echo v.find(3.0)
echo v.find_if(it > 2)
echo v.find_if_not(it < 2)

# Any algorithms

template any_of*(sequence, search_for: untyped): bool =
  var result = false
  for it {.inject.} in items(sequence):
    if search_for:
      result = true
      break
  result

template all_of*(sequence, search_for: untyped): bool =
  var result = false
  for it {.inject.} in items(sequence):
    if search_for:
      result = true
      break
  result

template none_of*(sequence, search_for: untyped): bool =
  var result = true
  for it {.inject.} in items(sequence):
    if search_for:
      result = false
      break
  result

echo v.any_of(it > 3)
echo v.all_of(it < 20)
echo v.none_of(it > 5)

# Count Algorithms

template count*(sequence, search_for: untyped): int =
  var result = 0
  for it {.inject.} in items(sequence):
    if search_for:
      inc result
  result

template count_if*(sequence, search_for: untyped): int =
  var result = 0
  for it {.inject.} in items(sequence):
    if search_for:
      inc result
  result
  
echo v.count(it == 3.0)
echo v.count_if(it > 2)

#[ Implementations Directly from C++ ]#

# Find Algorithms

template find*(sequence, first, last, search_for: untyped): int =
  var result = first
  for it {.inject.} in sequence[first..last]:
    if search_for:
      break
    inc result
  result

template find_if*(sequence, first, last, search_for: untyped): int =
  var result = first
  for it {.inject.} in sequence[first..last]:
    if search_for:
      break
    inc result
  result

template find_if_not*(sequence, first, last, search_for: untyped): int =
  var result = first
  for it {.inject.} in sequence[first..last]:
    if search_for == false:
      break
    inc result
  result

echo v.find(v.low, v.high, it == 3.0)
echo v.find_if(v.low, v.high, it > 2)
echo v.find_if_not(v.low, v.high, it < 2)

# Any Algorithms

template all_of*(sequence, first, last, search_for: untyped): bool =
  var result = false
  if find_if_not(sequence, first, last, search_for) == sequence.len:
    result = true
  result

template any_of*(sequence, first, last, search_for: untyped): bool =
  var result = false
  if find_if(sequence, first, last, search_for) != sequence.len:
    result = true
  result

template none_of*(sequence, first, last, search_for: untyped): bool =
  var result = false
  if find(sequence, first, last, search_for) == sequence.len:
    result = true
  result

echo v.any_of(v.low, v.high, it > 3)
echo v.all_of(v.low, v.high, it < 20)
echo v.none_of(v.low, v.high, it > 5)

# Count Algorithms

template count*(sequence, first, last, search_for: untyped): int =
  var result = 0
  for it {.inject.} in sequence[first..last]:
    if search_for:
      inc result
  result

template count_if*(sequence, first, last, search_for: untyped): int =
  var result = 0
  for it {.inject.} in sequence[first..last]:
    if search_for:
      inc result
  result
  
echo v.count(v.low, v.high, it == 3.0)
echo v.count_if(v.low, v.high, it > 2)

# Mismatch Algorithms

var x = @[1.0,3.0,3.0,3.0,3.0]

template mismatch*(sequence, first1, last1, first2: untyped): tuple =
  var 
    f1 = first1
    l1 = last1
    f2 = first2
    result = (sequence[f1], sequence[f2])
  while f1 != l1 and f1 == f2:
    inc f1, f2
  result
  
echo v.mismatch(v.low, v.high, x.low)
echo v.mismatch(v.low, v.high, x.low)

# For Each change these not to modify in place

proc twos(a: var float): float =
  a * 2.0

template for_each*[T](sequence: var seq[T]; first, last: int; procedure: proc): seq[T] =
  for i in first..last:
    sequence[i] = procedure(sequence[i])
  sequence

template for_each_n*[T](sequence: var seq[T]; first, n: int; procedure: proc): seq[T] =
  # raise exception if n > high
  for i in first..<first + n:
    sequence[i] = procedure(sequence[i])
  sequence

echo x.for_each(x.low, x.high, twos)
echo x.for_each_n(x.low, 2, twos)
