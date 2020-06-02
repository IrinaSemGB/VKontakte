//
//  CustomCollectionLayout.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 18.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize
}


class CustomCollectionLayout: UICollectionViewLayout {
    
    weak var delegate: CustomLayoutDelegate?
    
    var numberOfColumns = 2
    var cellPadding: CGFloat = 3
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    
    private var contentWeidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.width
    }
    
    
    // MARK: - CollectionView Content Size
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWeidth, height: contentHeight)
    }
    
    
    // MARK: - Prepare
    
    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let columnWeidth = self.contentWeidth / CGFloat(self.numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0..<self.numberOfColumns {
            xOffset.append(CGFloat(column) * columnWeidth)
        }
        
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: self.numberOfColumns)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate?.collectionView(collectionView, sizeOfPhotoAtIndexPath: indexPath)
            
            let cellWidth = columnWeidth
            var cellHeight = photoSize!.height * cellWidth / photoSize!.width
            cellHeight = cellPadding * 2 + cellHeight
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: cellWidth, height: cellHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            self.cache.append(attributes)
            
            self.contentHeight = max(contentWeidth, frame.maxY)
            yOffset[column] = yOffset[column] + cellHeight
            
            if self.numberOfColumns > 1 {
                
                var isColumnChanged = false
                for index in (1..<numberOfColumns).reversed() {
                    if yOffset[index] >= yOffset[index - 1] {
                        column = index - 1
                        isColumnChanged = true
                    } else {
                        break
                    }
                }
                if isColumnChanged {
                    continue
                }
            }
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    
    // MARK: - Layout Attributes For Elements
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in self.cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    
    // MARK: - Layout Attributes For Item
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.cache[indexPath.item]
    }
}
