//
//  ViewController.swift
//  AppleViewControllers
//
//  Created by Emily Mearns on 6/14/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    // MARK: - Action Buttons
    
    // MARK: - Image Picker Controller Methods
    
    @IBAction func imageTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Please choose image source", message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(photoLibraryAction)
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (_) in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(cameraAction)
        }
        
        let savedPhotosAction = UIAlertAction(title: "Camera Roll", style: .Default) { (_) in
            imagePicker.sourceType = .SavedPhotosAlbum
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(savedPhotosAction)
        }
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        myImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Email Methods

    @IBAction func emailTapped(sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["masonc.earl@gmail.com", "habibmiranda@yahoo.com"])
        mailComposer.setSubject("Testing in class")
        mailComposer.setMessageBody("Waaaaaaay up I feel blessed", isHTML: false)
        if let image = myImageView.image, imageData = UIImageJPEGRepresentation(image, 0.3) {
            mailComposer.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "Click bait")
        }
        presentViewController(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UIActivityViewController Methods
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        guard let image = myImageView.image else { return }
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func browserButtonTapped(sender: AnyObject) {
        guard let url = NSURL(string: "https://www.google.com/imghp?gws_rd=ssl") else { return }
        let safariVC = SFSafariViewController(URL: url)
        presentViewController(safariVC, animated: true, completion: nil)
    }
    
}








