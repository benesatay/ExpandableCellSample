//
//  ViewController.swift
//  ListWithExpandableCell
//
//  Created by Bahadır Enes Atay on 5.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let FAQCellId = String(describing: FAQCell.self)
    
    private var listViewModel: [ViewModel] = ListViewModel.list
    
    lazy private var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.createGradientLayer(
            [UIColor.systemBlue.withAlphaComponent(0.5).cgColor, UIColor.blue.cgColor],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1)
        )
        
        view.addSubview(tableView)
        tableView.register(FAQCell.self, forCellReuseIdentifier: FAQCellId)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FAQCellId, for: indexPath) as? FAQCell {
            cell.data = listViewModel[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listViewModel[indexPath.row].isExpanded.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
