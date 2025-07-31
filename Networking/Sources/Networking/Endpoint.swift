//
//  Endpoint.swift
//  AsyncLetReproducer
//
//  Created by Kiel Gillard on 25/7/2025.
//


public enum Endpoint {
    public enum SpecificEndpointOption {
        case full
        case this
        case that
    }
    case specific(SpecificEndpointOption)
}
