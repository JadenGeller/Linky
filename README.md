# Linky

`LinkedList` is a value-semantic linked list.
```swift
let array: Array      = [1, 2, 3, 4]
let list:  LinkedList = [1, 2, 3, 4]
```

Just like with an `Array`, modifying a copy does NOT modify the original.
```swift
var arrayCopy = array
var listCopy  = list

arrayCopy[0] = 100
listCopy[0]  = 100

print(array) // -> [1, 2, 3, 4]
print(list)  // -> [1, 2, 3, 4]
```

Since we have value-semantics, we can make multiple copies of the list and modify them independently.
```swift
var a: LinkedList = ["Swift", "Rust", "Scala"]
var b = a

a[0] = "C"
b[3] = "Haskell"

print(a) // ["C", "Rust", "Scala"]
print(b) // ["Swift", "Rust", "Haskell"]
```
