//
//  MainVC.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 24/08/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    
    let layers = [CellInfo(title: "CALayer", segueId: "toCALayer"), CellInfo(title: "CAScrollLayer", segueId: "toCAScrollLayerVC"), CellInfo(title: "CATextLayer", segueId: "toCATextLayerVC"), CellInfo(title: "AVPlayerLayer", segueId: "toAVPlayerLayerVC")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return layers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = layers[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
        let segueId = layers[indexPath.row].segueId
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.largeTitleDisplayMode = .never
    }

}
