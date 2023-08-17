//
//  APICall.swift
//  Rainbow Six Siege Tracker
//
//  Created by Vishnu Varma on 7/17/23.
//

import Foundation
import UIKit
import Combine

class APICall: ObservableObject {
    /*var data: user_data = user_data(metadata: user_metadata(avatar_url: "", level: 0, platform: "", ubisoft_id: "", last_updated: "", user: ""), stats_general: user_stats_general(rank: user_rank(mmr: 0, max_mmr: 0, last_mmr_change: 0), assists: 0, barricades_deployed: 0, blind_kills: 0, deaths: 0, gadgets_destroyed: 0, kills: 0, kd: 0.0, headshots: 0, headshot_kill_ratio: "", melee_kills: 0, penetration_kills: 0, wins: 0, losses: 0, playtime_in_seconds: 0, played_games: 0, reinforcements: 0, revives: 0, suicided: 0, win_lose: 0), stats_by_queue: user_stats_by_queue(casual: user_casual(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0), ranked: user_ranked(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0), others: user_others(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0)))
    var metadata: user_metadata = user_metadata(avatar_url: "", level: 0, platform: "", ubisoft_id: "", last_updated: "", user: "")
    var rank: user_rank = user_rank(mmr: 0, max_mmr: 0, last_mmr_change: 0)
    var stats_general: user_stats_general = user_stats_general(rank: user_rank(mmr: 0, max_mmr: 0, last_mmr_change: 0), assists: 0, barricades_deployed: 0, blind_kills: 0, deaths: 0, gadgets_destroyed: 0, kills: 0, kd: 0.0, headshots: 0, headshot_kill_ratio: "", melee_kills: 0, penetration_kills: 0, wins: 0, losses: 0, playtime_in_seconds: 0, played_games: 0, reinforcements: 0, revives: 0, suicided: 0, win_lose: 0)
    var casual: user_casual = user_casual(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0)
    var ranked: user_ranked = user_ranked(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0)
    var others: user_others = user_others(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0)
    var stats_by_queue: user_stats_by_queue = user_stats_by_queue(casual: user_casual(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0), ranked: user_ranked(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0), others: user_others(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0))
    */
    @Published var user: UserData = UserData(status: 0, data: user_data(metadata: user_metadata(avatar_url: "", level: 0, platform: "", ubisoft_id: "", last_updated: "", user: ""), stats_general: user_stats_general(rank: user_rank(mmr: 0, max_mmr: 0, last_mmr_change: 0), assists: 0, barricades_deployed: 0, blind_kills: 0, deaths: 0, gadgets_destroyed: 0, kills: 0, kd: 0.0, headshots: 0, headshot_kill_ratio: "", melee_kills: 0, penetration_kills: 0, wins: 0, losses: 0, playtime_in_seconds: 0, played_games: 0, reinforcements: 0, revives: 0, suicides: 0, win_lose: 0.0), stats_by_queue: user_stats_by_queue(casual: user_casual(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0.0), ranked: user_ranked(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0.0), others: user_others(deaths: 0, kills: 0, kd: 0.0, played_games: 0, wins: 0, losses: 0, playtime_in_seconds: 0, win_lose: 0.0))))

    
    
    
    func makeAPICall(_ username: String) {
        
        guard let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username) else{
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            //have data
            var result: UserData
            do{
                result = try JSONDecoder().decode(UserData.self, from: data)
                //print(result!)
                DispatchQueue.main.async {
                    self.user = result
                    print(self.user.data.metadata.level)
                    print(self.user.data.stats_general.kills)
                }
            }
            catch{
                //throw error
                debugPrint(error)
                //print("failed to convert \(error.localizedDescription)")
            }
            /*guard let user = result else {
                return
            }*/
            
            //print(self.user.data.metadata.level)
            //print(self.user.data.stats_general.kills)
            
        })
        task.resume()
        
        
        
        
        
        
        /*
        //NOT  BAD
        guard let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            //Convert to JSON
            do {
                let rainbowStats = try JSONDecoder().decode(UserData.self, from: data)
                DispatchQueue.main.async {
                    self?.user = rainbowStats
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
        
        
        */
    }

        
        
        
        
        
        /*
        print(username + "API")
        
        guard let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username) else { fatalError("Missing URL") }
        print("https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username)
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(UserData.self, from: data)
                        DispatchQueue.main.async {
                            self.user = decodedUsers
                        }
                        //print("CLOSE")
                        //print(self.user)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
        print("FINISH")
    }*/
}
        
        /*let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username)!
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        */
        
        
        
        
        
        
        
        
        

        
        
        
        
        /*
        //print(username)
        let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request error: ", error)
                return
            }
        
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUser = try JSONDecoder().decode(UserData.self, from: data)
                        self.user = decodedUser
                        //return decodedUser
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
        //print()
        */
        /*
        // Create URL
        let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username)
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            /*
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                            
                    // Print out entire dictionary
                    print(convertedJsonIntoDict)
                            
                    // Get value by key
                    let userId = convertedJsonIntoDict["status"]
                    print(userId ?? "userId could not be read")
                    }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            */
            guard let data = data else { return }
            // Using parseJSON() function to convert data to Swift struct
            let userItem = self.parseJSON(data: data)
                        
            // Read todo item title
            guard let user = userItem else { return }
            print("User Level = \(user.user_data.user_metadata.level)")

            
            
        }
        task.resume()
        */
/*   }
 func parseJSON(data: Data) -> UserData? {
 
 var returnValue: UserData?
 do {
 returnValue = try JSONDecoder().decode(UserData.self, from: data)
 } catch {
 print("Error took place\(error.localizedDescription).")
 }
 
 return returnValue
 }
 }
 
 /*
  //@Binding var user: String
  func makeAPICall(_ username: String) {
  //print(username)
  let url = URL(string: "https://api.henrikdev.xyz/r6/v1/profile/xbox/" + username)!
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  
  let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
  if let error = error {
  print("Request error: ", error)
  return
  }
  
  guard let response = response as? HTTPURLResponse else { return }
  if response.statusCode == 200 {
  guard let data = data else { return }
  DispatchQueue.main.async {
  do {
  let decodedUser = try JSONDecoder().decode([UserData].self, from: data)
  self.user = decodedUser
  } catch let error {
  print("Error decoding: ", error)
  }
  }
  }
  }
  
  dataTask.resume()
  
  }*/
 */
