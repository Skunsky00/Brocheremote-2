//
//  Constants.swift
//  Broche
//
//  Created by Jacob Johnson on 2/13/23.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_POST = Firestore.firestore().collection("Post")
