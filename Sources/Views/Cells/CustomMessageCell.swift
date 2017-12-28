//
//  CustomMessageCell.swift
//  MessageKit
//
//  Created by  Tobias Reinsch on 28.12.17.
//  Copyright © 2017 MessageKit. All rights reserved.
//

import Foundation
import UIKit

open class CustomMessageCell: MessageCollectionViewCell {
    
    open override class func reuseIdentifier() -> String { return "messagekit.cell.custommessage" }
    
    open var customView = UIView()
    
    open func setupConstraints() {
        customView.fillSuperview()
    }
    open override func setupSubviews() {
        super.setupSubviews()
        messageContainerView.addSubview(customView)
        setupConstraints()
    }
    
    open override func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        super.configure(with: message, at: indexPath, and: messagesCollectionView)
        switch message.data {
        case .custom(let customObject):
            if let view = delegate?.viewForCustomCell(with: message) {
                self.customView.removeFromSuperview()
                self.customView = view
                setupSubviews()
            }
        default:
            break
        }
    }
}

protocol CustomMessageCellLayoutDelegate {
    
}
