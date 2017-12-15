//
//  main.swift
//  CreateGoogleSearchURL
//
//

// struct helper to create google search URLs


import Foundation

// let's run it
let urlAllDeafault = GoogleSearchBuilder(searchTerm: "pictures of landscape") // all the defaults taking place

let urlValuesSupplied = GoogleSearchBuilder(searchTerm: "pictures of landscape", domain: GoogleSearchBuilder.HostDomains.uk , nbrOfResults: 5) // some values  are supplied


