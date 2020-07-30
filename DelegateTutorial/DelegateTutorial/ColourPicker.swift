import UIKit

//Step 1
protocol ColourPickerDelegate: class { //Naming convention? What exactly is the intent of the protocol?
    func changeBackgroundColour(colourPicker: ColourPicker,_ colour: UIColor?) //Always optional?
}

class ColourPicker: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!

    //Step 2
    weak var colourPickerDelegate: ColourPickerDelegate? //Why weak? Always optional? Wouldn't it be better to force it to be valid?

    override func viewDidLoad() {
        super.viewDidLoad()

        blueView.backgroundColor = .blue
        blueView.layer.borderColor = UIColor.white.cgColor
        blueView.layer.borderWidth = 2.0
        blueView.layer.cornerRadius = blueView.frame.width / 2
        blueView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))

        redView.backgroundColor = .red
        redView.layer.borderColor = UIColor.white.cgColor
        redView.layer.borderWidth = 2.0
        redView.layer.cornerRadius = redView.frame.width / 2
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        dismissView(animated: true)
    }
    
    @objc func handleTap(_ tapGesture: UITapGestureRecognizer) {
        let selectedColour = tapGesture.view?.backgroundColor
        //view.backgroundColor = selectedColour

        //Step 3
        colourPickerDelegate?.changeBackgroundColour(colourPicker: self, selectedColour)

    }

    public func dismissView(animated: Bool) {
        navigationController?.dismiss(animated: true)
    }
}
