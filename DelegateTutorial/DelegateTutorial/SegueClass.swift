import UIKit

//Step 4
class SegueClass: UIViewController, ColourPickerDelegate { //Is this correct? Maybe have a separate class for the delegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Step 5
        //I need some insights as to what's actually happening here...
        if  let nav = segue.destination as? UINavigationController,
            let colourPicker = nav.topViewController as? ColourPicker {
                colourPicker.colourPickerDelegate = self
        }
    }
    
    //Step 6
    func changeBackgroundColour(colourPicker: ColourPicker, _ colour: UIColor?) {
        view.backgroundColor = colour
        colourPicker.dismissView(animated: true)
    }
}

extension SegueClass: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
