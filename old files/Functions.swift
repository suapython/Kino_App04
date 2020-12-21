//
//  Classes.swift
//  Kinoscope
//
//  Created by jose francisco morales on 09/02/2018.
//  Copyright © 2018 jose francisco morales. All rights reserved.
//

import Foundation

import UIKit


//let allFilms = arrayFilm()
//let allUsers = arrayUser()
let colors = ["Red","Cyan","Green","Magenta","Blue","Yellow"]


func createUnionColor()-> [String: [[String]]]{
    var colorFilmUnion = [String: [[String]]]()
//    for color in colors {
//        colorFilmUnion[color]=unionList(topList: (allUsers[color]?.topTenList)! as! [String])
//
//    }
 return colorFilmUnion
}


func unionList(topList: [String] ) -> [[String]]{
    
    var userTitles=[[String]]()
    var userDirectors=[[String]]()
    var userActors=[[String]]()
    var userGenres=[[String]]()
    var userKeywords=[[String]]()
    
    
    for  title in topList {
//        if allFilms[title] != nil {
//            userTitles.append( allFilms[title]!.title  )
//            userDirectors.append( allFilms[title]!.director  )
//            userActors.append( allFilms[title]!.actor  )
//            userGenres.append( allFilms[title]!.genre  )
//            userKeywords.append( allFilms[title]!.keyword  )
//        }
    }
    
    
    
    return [Array(userTitles.joined()),Array(userDirectors.joined()),Array(userActors.joined()),Array(userGenres.joined()),Array(userKeywords.joined())]
}



func intersection2User(user1: [[String]], user2: [[String]]  ) -> (common : [[String]],res: Int ) {
    
    let commonTitles = Set(user1[0]).intersection(Set(user2[0]))
    let commonDirectors = Set(user1[1]).intersection(Set(user2[1]))
    let commonActors = Set(user1[2]).intersection(Set(user2[2]))
    let commonGenres = Set(user1[3]).intersection(Set(user2[3]))
    let commonKeywords = Set(user1[4]).intersection(Set(user2[4]))
    let common =  [Array(commonTitles),Array(commonDirectors),Array(commonActors) ]
    let res=Int(40*Int(commonTitles.count)+60*Int(commonDirectors.count)+20*Int(commonActors.count)+3*Int(commonGenres.count)+Int(commonKeywords.count))
    
    return (common,res )
    
}


func kinoCompute(usermovies: [String] ) -> (common: [String : [[String]] ] ,resc : [CGFloat] , rgb: [CGFloat], hue: [CGFloat]) {
    
    let ut1=unionList(topList: usermovies)
    var resc = [CGFloat]()
    var common = [String : [[String]]]()
    var rgb = [CGFloat]()
    var hue = [CGFloat]()
    
   
    for color in colors {
        let ut2=createUnionColor()[color]!
        let intc=intersection2User(user1: ut1,user2: ut2)
        resc.append(CGFloat(intc.res))
        common[color]=intc.common
    }
    rgb = [  resc[0]/(resc[0]+resc[1]+0.1)*255 , resc[2]/(resc[2]+resc[3]+0.1)*255, resc[4]/(resc[4]+resc[5]+0.1)*255]
    
    let hue0 = rgbToHue(r: rgb[0], g: rgb[1], b: rgb[2])
    hue = [hue0.h, hue0.s, hue0.b]
    
    
    
    return ( common,resc,rgb,hue)
}



func wheelDisplay(text: String, huecode: [CGFloat]    )->UIImage {
    
    let wheelImage = UIImage(named:"color_wheel_2")!
    let rr = Double(huecode[1])
    let theta = Double(90-huecode[0])*Double.pi/180
    let xy0 =  Double(wheelImage.size.height/2)
    
    let xx = xy0*(1+rr*cos(theta))
    let yy = xy0*(1-rr*cos(theta))
    
print(text)
    print(wheelImage.size.height)
    print(xx)
    print(yy)
    
    
    let newimage = textToImage(drawText: text, inImage: wheelImage, atPoint: CGPoint(x:xx, y:yy))
     return newimage
    
    
    
}



func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
    let textColor = UIColor.black
    let textFont = UIFont(name: "Helvetica Bold", size: 25)!
    
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
    
    let textFontAttributes = [
        NSAttributedString.Key.font: textFont,
        NSAttributedString.Key.foregroundColor: textColor,
    ] as [NSAttributedString.Key : Any]
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
    
    let rect = CGRect(origin: point, size: image.size)
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

func DrawOnImage(startingImage: UIImage,xposition x0: Int,yposition y0: Int  ) -> UIImage {
    
    // Create a context of the starting image size and set it as the current one
    UIGraphicsBeginImageContext(startingImage.size)
    
    // Draw the starting image in the current context as background
    startingImage.draw(at: CGPoint.zero)
    
    // Get the current context
    let context = UIGraphicsGetCurrentContext()!
    
    
    
    // Draw a transparent green Circle
    context.setStrokeColor(UIColor.black.cgColor)
    context.setAlpha(1)
    context.setLineWidth(10.0)
    context.addEllipse(in: CGRect(x: x0, y: y0, width: 10, height: 10))
    context.drawPath(using: .fillStroke) // or .fillStroke if need filling
    
    // Save the context as a new UIImage
    let myImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    // Return modified image
    return myImage!
}





func rgbToHue(r:CGFloat,g:CGFloat,b:CGFloat) -> (h:CGFloat, s:CGFloat, b:CGFloat) {
    let minV:CGFloat = CGFloat(min(r, g, b))
    let maxV:CGFloat = CGFloat(max(r, g, b))
    let delta:CGFloat = maxV - minV
    var hue:CGFloat = 0
    if delta != 0 {
        if r == maxV {
            hue = (g - b) / delta
        }
        else if g == maxV {
            hue = 2 + (b - r) / delta
        }
        else {
            hue = 4 + (r - g) / delta
        }
        hue *= 60
        if hue < 0 {
            hue += 360
        }
    }
    let saturation = maxV == 0 ? 0 : (delta / maxV)
    let brightness = maxV/255
    return (h:hue , s:saturation, b:brightness)
}

func kinoDisplay (imagein: UIImage, userinData:  [String: [String]]  ) -> UIImage{
    
    
    var newimage = imagein
    let wheelradius = imagein.size.height/2
    
    for  (key,values) in userinData {
    
    var kinoResult =  kinoCompute(usermovies: values)
    

        let rr = kinoResult.hue[1]*wheelradius
        let theta = (90-kinoResult.hue[0])*CGFloat(M_PI/180)
        let xx = wheelradius+rr*cos(theta)-10
        let yy = wheelradius-rr*sin(theta)
    
    newimage = textToImage(drawText: key, inImage: newimage, atPoint: CGPoint(x:xx, y:yy))
    
    }
    
        
    return newimage
    
}


func kinoDisplayX (filmin:    [String] ) -> UIImage{
    
     let image = UIImage(named:"color_wheel_2")!
     let wheelradius = image.size.height/2
        
        var kinoResult =  kinoCompute(usermovies: filmin)
        
        
        let rr = kinoResult.hue[1]*wheelradius
        let theta = (90-kinoResult.hue[0])*CGFloat(M_PI/180)
        
        
        let xx = wheelradius+rr*cos(theta)-10
        let yy = wheelradius-rr*sin(theta)
        
    
        
        var newimage = textToImage(drawText: "X", inImage: image, atPoint: CGPoint(x:xx, y:yy))
    
    
    return newimage
    
    
    
}


func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>)
    -> Dictionary<K,V>
{
    var map = Dictionary<K,V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}

