import UIKit

//MARK: - sample 1
print("-----sample 1-----")
class AbstractRemoteForTV {
    private var remoteController: RemoteForTV
    
    init(_ remote: RemoteForTV) {
        self.remoteController = remote
    }
    
    func tapOnDifferentButton() {
        print("Make some base action")
        remoteController.tapOnButton()
    }
}

protocol RemoteForTV {
    func tapOnButton()
}

class SensorRemoteController: RemoteForTV {
    func tapOnButton() {
        print("Tap on sensor button")
    }
}

class ButtonsRemoteController: RemoteForTV {
    func tapOnButton() {
        print("Tap on buttons button remote controller")
    }
}

var remoteController = AbstractRemoteForTV.init(SensorRemoteController())
remoteController.tapOnDifferentButton()

remoteController = AbstractRemoteForTV.init(ButtonsRemoteController())
remoteController.tapOnDifferentButton()

//MARK: - sample 2
print("-----sample 2-----")
protocol ColourForFigure {
    var figure: Figure {get set}
    func getColourFigure() -> String
}

class RedColourForFigure: ColourForFigure {
    internal var figure: Figure
    
    init(_ figure: Figure) {
        self.figure = figure
    }
    
    func getColourFigure() -> String {
        return "you get a red \(self.figure.getDescOfFigure())"
    }
}

class BlueColourForFigure: ColourForFigure {
    internal var figure: Figure
    
    init(_ figure: Figure) {
        self.figure = figure
    }
    
    func getColourFigure() -> String {
        return "blue figure: \(self.figure.getDescOfFigure())"
    }
}

protocol Figure {
    func getDescOfFigure() -> String
}

class Square: Figure {
    func getDescOfFigure() -> String {
        return "best of the best square"
    }
}

class Rectangle: Figure {
    func getDescOfFigure() -> String {
        return "rectangle"
    }
}

var redFigure = RedColourForFigure.init(Square())
print(redFigure.getColourFigure())

redFigure = RedColourForFigure.init(Rectangle())
print(redFigure.getColourFigure())

var blueFigure = BlueColourForFigure.init(Square())
print(blueFigure.getColourFigure())

blueFigure = BlueColourForFigure.init(Rectangle())
print(blueFigure.getColourFigure())
