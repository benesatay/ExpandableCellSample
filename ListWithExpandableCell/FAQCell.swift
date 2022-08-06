//
//  FAQCell.swift
//  ListWithExpandableCell
//
//  Created by Bahadır Enes Atay on 6.08.2022.
//

import UIKit

class FAQCell: UITableViewCell {
    
    private enum CellGap: CGFloat {
        case small = 5
        case regular = 10
        case big = 20
    }
    
    private enum CellImage: String {
        case minus
        case plus
    }
    
    lazy private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy private var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy private var answerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.isHidden = true
        return label
    }()
    
    lazy private var expandImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: CellImage.plus.rawValue)
        return image
    }()
    
    public var data: ViewModel? {
        didSet {
            guard let question = data?.question,
                  let answer = data?.answer,
                  let isExpanded = data?.isExpanded else { return }
            updateUI(question, answer, isExpanded)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        questionLabel.text = nil
        answerLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.addSubview(expandImage)
        containerView.addSubview(questionLabel)
        containerView.addSubview(answerLabel)
        makeConstraints()
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(CellGap.small.rawValue)
        }
        expandImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(10)
            make.trailing.equalToSuperview().inset(CellGap.big.rawValue)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(CellGap.big.rawValue)
            make.leading.equalToSuperview().inset(CellGap.regular.rawValue)
            make.trailing.lessThanOrEqualTo(expandImage.snp.leading).offset(-CellGap.big.rawValue)
        }
        answerLabel.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom)
            make.height.equalTo(0)
        }
    }
    
    private func showAnswer() {
        expandImage.snp.remakeConstraints { make in
            make.centerY.equalTo(questionLabel)
            make.size.equalTo(10)
            make.trailing.equalToSuperview().inset(CellGap.small.rawValue)
        }
        questionLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().inset(CellGap.big.rawValue)
            make.leading.equalToSuperview().inset(CellGap.regular.rawValue)
            make.trailing.lessThanOrEqualTo(expandImage.snp.leading).offset(-CellGap.big.rawValue)
        }
        answerLabel.snp.remakeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(3*CellGap.regular.rawValue)
            make.leading.trailing.equalToSuperview().inset(CellGap.regular.rawValue)
            make.bottom.equalToSuperview().inset(CellGap.big.rawValue)
        }
    }
        
    private func hideAnswer() {
        expandImage.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(10)
            make.right.equalToSuperview().inset(CellGap.small.rawValue)
        }
        questionLabel.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview().inset(CellGap.big.rawValue)
            make.leading.equalToSuperview().inset(CellGap.regular.rawValue)
            make.trailing.lessThanOrEqualTo(expandImage.snp.leading).offset(-CellGap.big.rawValue)
        }
        answerLabel.snp.remakeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom)
            make.height.equalTo(0)
        }
    }
    
    private func updateUI(_ question: String, _ answer: String, _ isExpanded: Bool) {
        questionLabel.text = question
        answerLabel.text = answer
        setAnswer(isHidden: !isExpanded)
    }
    
    private func setAnswer(isHidden: Bool) {
        answerLabel.isHidden = isHidden
        if isHidden {
            expandImage.image = UIImage(named: CellImage.plus.rawValue)
            hideAnswer()
        } else {
            expandImage.image = UIImage(named: CellImage.minus.rawValue)
            showAnswer()
        }
    }
}
