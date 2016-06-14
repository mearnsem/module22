//: Playground - noun: a place where people can play

import UIKit

class Restaurant {
    
    var name: String
    var streetAddress: String
    var city: String
    var state: String
    var reviews: [Review]
    
    var hashtags: [String] {
        let hashtag: String = "#"
        
        
        return [hashtag]
    }
    
    init(name: String, streetAddress: String, city: String, state: String, reviews: [Review]) {
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.reviews = reviews
    }
}

class Review {
    
    var username: String
    var text: String
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
}

let lucky13Review1 = Review(username: "Em", text: "Great burgers! #garlicfries")
let lucky13Review2 = Review(username: "Kent", text: "Get the stinky cheese!")
let lucky13Reviews = [lucky13Review1, lucky13Review2]

let cutlersReview1 = Review(username: "AH", text: "Get the B-town!")
let cutlersReview2 = Review(username: "cam84", text: "The cookies are to die for #sugarcookie")
let cutlersReviews = [cutlersReview1, cutlersReview2]

let lucky13 = Restaurant(name: "Lucky 13", streetAddress: "135 1300 S", city: "SLC", state: "UT", reviews: lucky13Reviews)
let cutlers = Restaurant(name: "Cutlers", streetAddress: "500 S", city: "Bountiful", state: "UT", reviews: cutlersReviews)

let restaurants = [lucky13, cutlers]

