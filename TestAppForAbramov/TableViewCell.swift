import UIKit

protocol CollectionViewDelegate {
    func transferToColorVc(backgroundColor: UIColor, id: Int)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var cellsCount = [4, 6, 8, 10]
    var id = 0
    var number = 4
    var delegate: CollectionViewDelegate?
    var titleForVc: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch id {
        case 0: return 4
        default: return 4 + 2 * id
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let colorForVc = cell.contentView.backgroundColor else { return }
        
        delegate?.transferToColorVc(backgroundColor: colorForVc, id: id)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        //Тут возникает проблема, полачается или тень или скругление
        cell.layer.cornerRadius = 20

        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        //false - тень, true - скругление
        cell.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        
        switch id {
        case 0:
            var numbers: [Double] = [0]
            var b = 0.0

            for _ in 0..<4 {
                let a: Double = 1.0 / 3.0
                b = b + a
                numbers.append(b)
            }

            cell.contentView.backgroundColor = UIColor(red: CGFloat(1 - numbers[indexPath.row]), green: 0, blue: 0, alpha: 1)

        case 1:
            var numbers: [Double] = [0]
            var b = 0.0

            for _ in 0..<(4 + (2 * id)) {
                let a: Double = 1.0 / Double(3 + (2 * id))
                b = b + a
                numbers.append(b)
            }

            cell.contentView.backgroundColor = UIColor(red: 0, green: CGFloat(1 - numbers[indexPath.row]), blue: 0, alpha: 1)

        case 2:
            var numbers: [Double] = [0]
            var b = 0.0

            for _ in 0..<(4 + (2 * id)) {
                let a: Double = 1.0 / Double(4 + (2 * id))
                b = b + a
                numbers.append(b)
            }

            cell.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: CGFloat(1 - numbers[indexPath.row]), alpha: 1)

        case 3:
            var numbers: [Double] = [0]
            var b = 0.0

            for _ in 0..<(4 + (2 * id)) {
                let a: Double = 1.0 / Double(4 + (2 * id))
                b = b + a
                numbers.append(b)
            }

            cell.contentView.backgroundColor = UIColor(red: CGFloat(1 - numbers[indexPath.row]), green: CGFloat(0.75 - numbers[indexPath.row]), blue: CGFloat(0.5 - numbers[indexPath.row]), alpha: 1)

        default:
            cell.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        return cell
    }
}
