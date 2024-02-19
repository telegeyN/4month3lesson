//
//  MakerView.swift
//  4month3lesson
//
//  Created by Telegey Nurbekova on 20/02/24.
//

import UIKit

class MakerView {
    
    func makerLabel(text: String = "",
                    font: UIFont = Fonts.light.size(14),
                    textColor: UIColor = .init(hex: "#5B5B5B"),
                    backgroundColor: UIColor = .clear,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode:NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    
    func makerTextField(text: String = "",
                        placeholder: String = "",
                        cornerRadius: CGFloat = 12,
                        textColor: UIColor = .black,
                        backgroundColor: UIColor = .init(hex: "#FFFFFF"),
                        borderColor: UIColor = .lightGray,
                        borderWidth: CGFloat = 0,
                        placeholderColor: UIColor = .init(hex: "#545151"),
                        placeholderFont: UIFont = Fonts.light.size(13),
                        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UITextField {
        let tf = UITextField()
        tf.text = text
        tf.placeholder = placeholder
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.layer.borderColor = borderColor.cgColor
        tf.layer.borderWidth = borderWidth
        tf.textColor = textColor
        tf.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: placeholderFont
        ]
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        return tf
    }
    
    
    func makerButton(backgroundColor: UIColor = .clear,
                     title: String = "",
                     titleColor: UIColor = .init(hex: "#000000", alpha: 0.9),
                     titleFont: UIFont = Fonts.light.size(12),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .clear,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
    
    
    func makerImage(imageName: String = "",
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return image
    }
}
