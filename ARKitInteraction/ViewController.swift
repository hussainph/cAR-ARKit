/*
Developer: Hussain Phalasiya
Dev Timestamp: Aug 15 9:00AM

SQA:
SQA Timestamp:

Abstract:
Main view controller for the AR experience.
*/

import ARKit
import SceneKit
import UIKit
import ARVideoKit
import Flutter
import FlutterPluginRegistrant

/// Project-wide UIViewController extension. Adds an Android-like "toast" alert that dismisses after a set time period.
extension UIViewController {
  func showToast(message: String, seconds: Double) {
    
    // Message taken as function arg
    let alert = UIAlertController(title: nil, message: message,
      preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15
    // Show alert to user
    present(alert, animated: true)
    // Use parallel CPU thread to dismiss toast after a set amount of seconds
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + seconds, execute: {alert.dismiss(animated: true)})
  }
}

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet var sceneView: VirtualObjectARView!
    
    @IBOutlet weak var addObjectButton: UIButton!
    
    @IBOutlet weak var startRecButton: UIButton!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var flutterButton: UIButton!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var upperControlsView: UIView!
    
    
    // MARK: - UI Elements
    
    let coachingOverlay = ARCoachingOverlayView()
    
    var focusSquare = FocusSquare()
    
    
    /// The view controller that displays the status and "restart experience" UI.
    lazy var statusViewController: StatusViewController = {
        return children.lazy.compactMap({ $0 as? StatusViewController }).first!
    }()
    
    /// The view controller that displays the virtual object selection menu.
    var objectsViewController: VirtualObjectSelectionViewController?
    
    // MARK: - ARKit Configuration Properties
    
    /// A type which manages gesture manipulation of virtual content in the scene.
    lazy var virtualObjectInteraction = VirtualObjectInteraction(sceneView: sceneView, viewController: self)
    
    /// Coordinates the loading and unloading of reference nodes for virtual objects.
    let virtualObjectLoader = VirtualObjectLoader()
    
    /// Marks if the AR experience is available for restart.
    var isRestartAvailable = true
    
    /// A serial queue used to coordinate adding or removing nodes from the scene.
    let updateQueue = DispatchQueue(label: "com.example.apple-samplecode.arkitexample.serialSceneKitQueue")
    
    /// Convenience accessor for the session owned by ARSCNView.
    var session: ARSession {
        return sceneView.session
    }
    /// Recorder variable for ARVideoKit access.
    var recorder:RecordAR?
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.session.delegate = self
        
        // Set up coaching overlay.
        setupCoachingOverlay()

        // Set up scene content.
        sceneView.scene.rootNode.addChildNode(focusSquare)

        // Hook up status view controller callback(s).
        statusViewController.restartExperienceHandler = { [unowned self] in
            self.restartExperience()
            
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showVirtualObjectSelectionViewController))
        // Set the delegate to ensure this gesture is only used when there are no virtual objects in the scene.
        tapGesture.delegate = self
        sceneView.addGestureRecognizer(tapGesture)
        //googleButton.addTarget(self, action: "didTapGoogle", forControlEvents: .TouchUpInside)
        recorder = RecordAR(ARSceneKit: sceneView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Prevent the screen from being dimmed to avoid interuppting the AR experience.
        UIApplication.shared.isIdleTimerDisabled = true

        // Start the `ARSession`.
        resetTracking()
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        recorder?.rest()
        session.pause()
    }
    

    // MARK: - Session management
    
    /// Creates a new AR configuration to run on the `session`.
    func resetTracking() {
        virtualObjectInteraction.selectedObject = nil
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        recorder?.prepare(configuration)
        if #available(iOS 12.0, *) {
            configuration.environmentTexturing = .automatic
        }
        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

        statusViewController.scheduleMessage("FIND A SURFACE TO PLACE AN OBJECT", inSeconds: 7.5, messageType: .planeEstimation)
    }

    // MARK: - Focus Square

    func updateFocusSquare(isObjectVisible: Bool) {
        if isObjectVisible || coachingOverlay.isActive {
            focusSquare.hide()
        } else {
            focusSquare.unhide()
            statusViewController.scheduleMessage("TRY MOVING LEFT OR RIGHT", inSeconds: 5.0, messageType: .focusSquare)
        }
        
        // Perform ray casting only when ARKit tracking is in a good state.
        if let camera = session.currentFrame?.camera, case .normal = camera.trackingState,
            let query = sceneView.getRaycastQuery(),
            let result = sceneView.castRay(for: query).first {
            
            updateQueue.async {
                self.sceneView.scene.rootNode.addChildNode(self.focusSquare)
                self.focusSquare.state = .detecting(raycastResult: result, camera: camera)
            }
            if !coachingOverlay.isActive {
                addObjectButton.isHidden = false
            }
            statusViewController.cancelScheduledMessage(for: .focusSquare)
        } else {
            updateQueue.async {
                self.focusSquare.state = .initializing
                self.sceneView.pointOfView?.addChildNode(self.focusSquare)
            }
            addObjectButton.isHidden = true
            objectsViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Error handling
    
    func displayErrorMessage(title: String, message: String) {
        // Blur the background.
        blurView.isHidden = false
        
        // Present an alert informing about the error that has occurred.
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.blurView.isHidden = true
            self.resetTracking()
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func startRecording(_ sender: UIButton) {
        recorder?.contentMode = .aspectFit
        // Tag system used to change function of Record button on multiple presses.
        sender.tag += 1
        if sender.tag > 2 { sender.tag = 0 }
        
        switch sender.tag {
        case 1:
            // First tag starts recording stream for the recorder, shows user notifying toast.
            
            recorder?.record()
            showToast(message: "Recording Started", seconds: 0.75)
        case 2:
            // Second case stops recording stream and exports final video, shows user notifying toast and resets tag to initial state '0'.
            recorder?.stopAndExport()
            showToast(message: "Recording saved to Gallery!", seconds: 1)
            
            /// Phased out, now using toast system to notify user and dismiss.
            /*
            let alert = UIAlertController(title: "Recording Saved", message: "Your recording was saved in Photo Gallery.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

            self.present(alert, animated: true)
            */
            sender.tag = 0
        default:
            break
        }
    }
    
    @IBAction func capturePhoto(_ sender: UIButton) {
        recorder?.contentMode = .aspectFit
        // Export recorder image capture to gallery
        recorder?.export(UIImage: recorder?.photo())
        showToast(message: "Photo saved to Gallery!", seconds: 1)
        
        /// Switched Alert declaration to toast system instead.
        /*
        let alert = UIAlertController(title: "Photo Saved", message: "Your photo was saved in Photo Gallery.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        */
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        let instagramHooks = "arcp317://"
        let instagramUrl = URL(string: instagramHooks)!
        if UIApplication.shared.canOpenURL(instagramUrl)
        {
            UIApplication.shared.openURL(NSURL(string: "arcp317://")! as URL)
        }
    }
    
    
    /// Deprecated. Works only for individual button. Switched to ButtonTag instead on single button to perform multiple functions.
    /*
    @IBAction func stopRecording(_ sender: UIButton) {
        let alert = UIAlertController(title: "Recording Saved", message: "Your recording was saved in Photo Gallery.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        recorder?.stopAndExport()
    }
 */
}
