//
//  LinkedList.swift
//  Linky
//
//  Created by Jaden Geller on 12/30/15.
//  Copyright © 2015 Jaden Geller. All rights reserved.
//

public struct LinkedList<Element>: ArrayLiteralConvertible {
    private var head: Node<Element>?
    
    public init(arrayLiteral elements: Element...) {
        if let first = elements.first {
            var node = Node(first)
            head = node
            for x in elements[1..<elements.endIndex] {
                let next = Node(x)
                node.nextBacking.backing = next
                node = next
            }
        }
        else {
            head = nil
        }
    }
}

extension LinkedList: MutableCollectionType {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        var count = 0
        var node = head
        while let unwrappedNode = node {
            node = unwrappedNode.next
            count++
        }
        return count - 1
    }
    
    public subscript(index: Int) -> Element {
        get {
            for (i,v) in enumerate() {
                if i == index { return v }
            }
            fatalError("fatal error: Linked list index out of range")
        }
        set {
            if head != nil {
                head?.setAncestorValue(distance: index, value: newValue)
            }
            else {
                fatalError("fatal error: Linked list index out of range")
            }
        }
    }
}

extension LinkedList: SequenceType {
    public func generate() -> LinkedListGenerator<Element> {
        return LinkedListGenerator(node: head)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var str = "["
        for (i, x) in enumerate() {
            str += "\(x)"
            if i != self.endIndex { str += ", " }
        }
        str += "]"
        return str
    }
}

public struct LinkedListGenerator<Element>: GeneratorType {
    private var node: Node<Element>?

    public mutating func next() -> Element? {
        guard let current = node else { return nil }
        node = current.next
        return current.value
    }
}

public func ==<Element: Equatable>(lhs: LinkedList<Element>, rhs: LinkedList<Element>) -> Bool {
    switch (lhs.head, rhs.head) {
    case (nil, nil):   return true
    case let (l?, r?): return l == r
    default:           return false
    }
}
