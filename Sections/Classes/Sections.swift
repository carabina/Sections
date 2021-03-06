//
//  Sections.swift
//  Robert Manson
//
//  Created by Robert Manson on 7/7/16.
//

import Foundation

public struct Section<T> {
    public let name: String
    public let rows: [T]

    public init (name: String, rows: [T]) {
        self.name = name
        self.rows = rows
    }
}

public struct BuildSection<T> {
    public typealias SectionClosure = ([T]) -> Section<T>?
    private var sectionClosures: [SectionClosure] = []
    public var values: [T]

    public var sections: [Section<T>] {
        return sectionClosures.flatMap { $0(values) }
    }

    public func addSection(f: SectionClosure) -> BuildSection<T> {
        var sections = self
        sections.sectionClosures.append(f)
        return sections
    }

    public init(values: [T]) {
        self.values = values
    }
}
