//
//  UserData.swift
//  Rainbow Six Siege Tracker
//
//  Created by Vishnu Varma on 7/18/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct UserData: Hashable, Codable {
    let status: Int
    let data: user_data
}

struct user_data: Hashable, Codable {
    
    let metadata: user_metadata
    let stats_general: user_stats_general
    let stats_by_queue: user_stats_by_queue
    
}
        
struct user_metadata: Hashable, Codable {
    let avatar_url: String
    let level: Int
    let platform: String
    let ubisoft_id: String
    let last_updated: String
    let user: String
    
}
        
        //Ranked + Cas
struct user_stats_general: Hashable, Codable {
    
    let rank: user_rank
    let assists: Int
    let barricades_deployed: Int
    let blind_kills: Int
    let deaths: Int
    let gadgets_destroyed: Int
    let kills: Int
    let kd: Double
    let headshots: Int
    let headshot_kill_ratio: String
    let melee_kills: Int
    let penetration_kills: Int
    let wins: Int
    let losses: Int
    let playtime_in_seconds: Int
    let played_games: Int
    let reinforcements: Int
    let revives: Int
    let suicides: Int
    let win_lose: Double
}

struct user_rank: Hashable, Codable {
    let mmr: Int
    let max_mmr: Int
    let last_mmr_change: Int
}
        
struct user_stats_by_queue: Hashable, Codable {
    
    let casual: user_casual
    let ranked: user_ranked
    let others: user_others
}
            
struct user_casual: Hashable, Codable {
    let deaths: Int
    let kills: Int
    let kd: Double
    let played_games: Int
    let wins: Int
    let losses: Int
    let playtime_in_seconds: Int
    let win_lose: Double
}
struct user_ranked: Hashable, Codable {
    let deaths: Int
    let kills: Int
    let kd: Double
    let played_games: Int
    let wins: Int
    let losses: Int
    let playtime_in_seconds: Int
    let win_lose: Double
}
struct user_others: Hashable, Codable {
    let deaths: Int
    let kills: Int
    let kd: Double
    let played_games: Int
    let wins: Int
    let losses: Int
    let playtime_in_seconds: Int
    let win_lose: Double
}

        

    /*
    let chess_rapid: chess_rapid
    let chess_blitz: chess_blitz
    let fide: Int
    let tactics: chess_tactics
    let puzzle_rush: chess_puzzle_rush
}

struct chess_rapid: Hashable, Codable {
    let record: chess_record
    let best: chess_best
    let last: chess_last
    
}


struct chess_blitz: Hashable, Codable {
    let record: chess_record
    let best: chess_best
    let last: chess_last
}

struct chess_record: Hashable, Codable{
    let win: Int
    let loss: Int
    let draw: Int
}

struct chess_best: Hashable, Codable {
    let rating: Int
    let date: Int
    let game: String
}

struct chess_last: Hashable, Codable {
    let rating: Int
    let date: Int
    let rd: Int
}

struct chess_tactics: Hashable, Codable {
    let highest: chess_highest
    let lowest: chess_lowest

}

struct chess_highest: Hashable, Codable {
    let rating: Int
    let date: Int
}

struct chess_lowest: Hashable, Codable {
    let rating: Int
    let date: Int
}

struct chess_puzzle_rush: Hashable, Codable {
    let best: chess_best_puzzle
}

struct chess_best_puzzle: Hashable, Codable {
    let total_attempts: Int
    let score: Int
}

*/







struct data: Hashable, Codable {
    
    var user_metadata: metadata
    var user_general_stats: stats_general
    //var user_stats_by_queue: stats_by_queue
    
}
        
struct metadata: Hashable, Codable {
    var avatar_url: String
    var level: Int
}
        
        //Ranked + Cas
struct stats_general: Hashable, Codable {
    
    var user_rank: rank
    var assists: Int
    var deaths: Int
    var kills: Int
    var kd: Double
    var headshots: Int
    var headshot_kill_ratio: String
    var blind_kills: Int
    var melee_kills: Int
    var penetration_kills: Int
    var wins: Int
    var losses: Int
    var playtime_in_seconds: Int
    var played_games: Int
            
}

struct rank: Hashable, Codable {
    var mmr: Int
}
        
        struct stats_by_queue: Hashable, Decodable {
            
            var user_casual: casual
            var user_ranked: ranked
            var user_others: others
            
            struct casual: Hashable, Decodable {
                var deaths: Int
                var kills: Int
                var kd: Double
                var played_games: Int
                var wins: Int
                var losses: Int
                var playtime_in_seconds: Int
            }
            struct ranked: Hashable, Decodable {
                var deaths: Int
                var kills: Int
                var kd: Double
                var played_games: Int
                var wins: Int
                var losses: Int
                var playtime_in_seconds: Int
            }
            struct others: Hashable, Decodable {
                var deaths: Int
                var kills: Int
                var kd: Double
                var played_games: Int
                var wins: Int
                var losses: Int
                var playtime_in_seconds: Int
            }
        }
        
        
        
