//
//  Node.swift
//  Linky
//
//  Created by Jaden Geller on 12/30/15.
//  Copyright © 2015 Jaden Geller. All rights reserved.
//

internal class NodeBacking<Element> {
    var backing: Element
    
    init(backing: Element) {
        self.backing = backing
    }
}

public struct Node<Element> {
    private var valueBacking: NodeBacking<Element>
    internal var nextBacking: NodeBacking<Node<Element>?>
    
    mutating internal func setAncestorValue(distance distance: Int, value: Element){
        if distance > 0 {
            if next != nil { next!.setAncestorValue(distance: distance - 1, value: value) }
            else { fatalError("fatal error: Linked list index out of range") }
        }
        else { setValueWithCopy(value) }
    }
    
    mutating private func setValueWithCopy(value: Element){
        if !isUniquelyReferencedNonObjC(&valueBacking) {
            valueBacking = NodeBacking(backing: value)
        }
        else {
            valueBacking.backing = value
        }
    }
    
    public init(_ value: Element) {
        valueBacking = NodeBacking(backing: value)
        nextBacking = NodeBacking(backing: nil)
    }
    
    public var value: Element {
        get {
            return valueBacking.backing
        }
        set {
            setValueWithCopy(newValue)
        }
    }
    
    public var next: Node<Element>? {
        get {
            return nextBacking.backing
        }
        set {
            nextBacking = NodeBacking(backing: newValue)
        }
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        get {
            return "\(value)"
        }
    }
}

public func ==<Element: Equatable>(lhs: Node<Element>, rhs: Node<Element>) -> Bool {
    return lhs.value == rhs.value && {
        // Workaround because Optional<Element: Equatable> is not Equatable
        switch (lhs.next, rhs.next) {
        case (nil, nil):   return true
        case let (l?, r?): return l == r
        default:           return false
        }
    }()
}
