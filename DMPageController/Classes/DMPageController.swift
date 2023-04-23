
public enum PageContollerType {
    case DMNormal
    case DMMoveSlide
    case DMCustomSlide(size: CGSize)
}

public class DMPageControlView: UIView {
    
    private lazy var viewList = [UIView]()
    private lazy var controlStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: viewList)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var activeView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    var pageContollerType: PageContollerType?
    var inactiveSize = CGSize(width: 12, height: 12)
    var activesize = CGSize(width: 12, height: 12)
    public var columSpace: CGFloat = 14
    public var duration = 0.3
    public var activeColor = UIColor.orange
    public var inactiveColor = UIColor.lightGray
    
    //view의 갯수 정의 및 커스텀된 Active바인지 확인
    public func setView(pages: Int, pageContollerType: PageContollerType = .DMNormal) {
        
        viewList = makeViewList(count: pages, type: pageContollerType)
        
        self.addSubview(controlStackView)
        
        controlStackView.spacing = columSpace
        
        NSLayoutConstraint.activate([
            controlStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            controlStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
            controlStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 0),
            controlStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0)
        ])
        
        self.pageContollerType = pageContollerType
        
        switch pageContollerType {
        case .DMCustomSlide(let size):
            activeView.backgroundColor = activeColor
            activeView.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            activeView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            activeView.layer.cornerRadius = size.height / 2
            activeView.clipsToBounds = true
            
            self.addSubview(activeView)
            NSLayoutConstraint.activate([
                activeView.centerXAnchor.constraint(equalTo: viewList[0].centerXAnchor,constant: 0),
                activeView.centerYAnchor.constraint(equalTo: viewList[0].centerYAnchor,constant: 0)
            ])
        case .DMMoveSlide:
            let defaultActiveSize = CGSize(width: 12, height: 12)
            activeView.backgroundColor = activeColor
            activeView.widthAnchor.constraint(equalToConstant: defaultActiveSize.width).isActive = true
            activeView.heightAnchor.constraint(equalToConstant: defaultActiveSize.height).isActive = true
            activeView.layer.cornerRadius = defaultActiveSize.height / 2
            activeView.clipsToBounds = true
            
            self.addSubview(activeView)
            NSLayoutConstraint.activate([
                activeView.centerXAnchor.constraint(equalTo: viewList[0].centerXAnchor,constant: 0),
                activeView.centerYAnchor.constraint(equalTo: viewList[0].centerYAnchor,constant: 0)
            ])
        case .DMNormal:
            print("JMNormal")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //보여질 뷰페이지만큼 생성
    private func makeViewList(count: Int, type: PageContollerType) -> [UIView] {
        var viewList : [UIView] = []
        if count != 0 {
            for i in 1...count {
                let view = UIView()
                
                view.translatesAutoresizingMaskIntoConstraints = false
                switch type {
                case .DMNormal:
                    if i == 1 {
                        view.backgroundColor = activeColor
                    } else {
                        view.backgroundColor = inactiveColor
                    }
                    view.widthAnchor.constraint(equalToConstant: inactiveSize.width).isActive = true
                    view.heightAnchor.constraint(equalToConstant: inactiveSize.height).isActive = true
                    view.layer.cornerRadius = inactiveSize.height / 2
                    view.clipsToBounds = true
                case .DMMoveSlide:
                    view.backgroundColor = inactiveColor
                    view.widthAnchor.constraint(equalToConstant: inactiveSize.width).isActive = true
                    view.heightAnchor.constraint(equalToConstant: inactiveSize.height).isActive = true
                    view.layer.cornerRadius = inactiveSize.height / 2
                    view.clipsToBounds = true
                case .DMCustomSlide(let size):
                    view.backgroundColor = inactiveColor
                    if size.height > size.width {
                        view.widthAnchor.constraint(equalToConstant: size.width).isActive = true
                        view.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                    } else {
                        view.widthAnchor.constraint(equalToConstant: size.height).isActive = true
                        view.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                    }
                    view.layer.cornerRadius = size.height / 2
                    view.clipsToBounds = true
                }
                
                viewList.append(view)
            }
        }
        
        return viewList
    }
    
    //페이지 변경
    public func changePage(_ page: Int) {
        if page < viewList.count && page > -1{
            switch pageContollerType {
            case .DMCustomSlide:
                UIView.animate(withDuration: duration, delay: 0) {
                    self.activeView.transform = CGAffineTransform(translationX: self.viewList[page].frame.origin.x , y: self.viewList[page].frame.origin.y)
                }
            case .DMMoveSlide:
                UIView.animate(withDuration: duration, delay: 0) {
                    self.activeView.transform = CGAffineTransform(translationX: self.viewList[page].frame.origin.x , y: self.viewList[page].frame.origin.y)
                }
            case .DMNormal:
                viewList.forEach { view in
                    view.backgroundColor = inactiveColor
                }
                viewList[page].backgroundColor = activeColor
            case .none:
                viewList.forEach { view in
                    view.backgroundColor = inactiveColor
                }
                viewList[page].backgroundColor = activeColor
            }
        }
    }
}
