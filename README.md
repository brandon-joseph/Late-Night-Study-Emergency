# Late Night Emergency - Because when you gotta go, you gotta go
Irena, Tyrone, Brandon

Original Idea by Jasmine Herrera
AppDev: iOS Development

## Important links:
Designer's page: https://www.figma.com/file/TmN9XYdEjcFZINIGAuMbNi/Emergency-Finder?node-id=0%3A1

Backend repo: https://github.coecis.cornell.edu/bjj43/BathroomHackChallenge/tree/BackendAPI   

Main View, shows a map with many markers:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/newmain.png?raw=true" width="200px" height="375px" />

Main View Table Click, if you click the "Table" button the top right you'll get a list of buildings and their proxmity to you:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/newtableview.png?raw=true" width="200px" height="375px" />

Marker Click, click on a marker for more information about the building:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/newmain%20marker.png?raw=true" width="200px" height="375px" />

On Marker Click, bring up building page, click the info window to get to a page about the building with useful information:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/onmarkerclick.png?raw=true" width="200px" height="375px" />

Click Floors button, click the floors button on the top right of the building page you see a floor plan of the building:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/floor1.png?raw=true" width="200px" height="375px" />

Can Alternate Floors, click the bottom buttons to choose what floor's floorplan you want to see:  

<img src="https://github.com/brandon-joseph/Late-Night-Study-Emergency/blob/master/Screenshots/floor2.png?raw=true" width="200px" height="375px" />

## Description

This app is used to find bathrooms at Cornell. When you first launch the app you're presented with a map that has many markers. These markers each correspond to a building. If you click on the "Table" button on the top right, you'll be taken to a TableView that lists all bathrooms in order of proximity to you. If you click on an individual marker it'll display the name of the building. If you then click on the info window that says "Click me" you'll be taken to a page specifically for the building. This page will have the building name, a picture of a bathroom, the distance away it is from you, a rough description of where the bathroom is in the building, logistics such as the number of stalls and the overall condition of the bathroom and finally an overall rating using a 5.0 system. If you click on the "Floors" button in the top right you'll be presented with a floor plan. This floorplan has three buttons on the bottom that can choose between floor, each one showing you it's unique floor plan (Currently since there is no way to get floorplans it's just the same images for every building). 

## How app meets list of requirements

### IOS:
    - Uses snapkit for Autolayout
    - Has a TableView displaying list of bathrooms and distances from you
    - Has tons of navigation, multiple ViewController
    - Integrates backend API in NetworkManager.swift file but currently not in use.
### Backend: 
  -TODO

## Original Proposal
Hacking Project Proposal

For the hack challenge, I hope to create an app that displays where the bathrooms are on
campus. Too often I am walking around campus, especially late at night, and I urgently need to
find the nearest bathroom. By making this app, I will solve that problem as the app will provide
several options of bathrooms, it’s location, and whether it is open. The app would have a simple
layout. The first screen, or the main screen, will have a map of campus based on the users’
current location. On the map, there would be UIButtons indicating a restroom with the ability to
click on it for more information. When the button is clicked, another screen will pop up. Within
this screen there would be a UILabel that has the name of the bathroom and a UITextView which
would provide a description of where it is within the building, the usual business, if it is open,
and the size. Also, there would be a UIImageView to allow the user to see whether they are in
the right place. In order to implement a map on the main screen, I would need to use the Google
Maps API.

### Anything Else?
The design is a bit different from the developed app because the design is a little complicated for a student in an introductory iOS class to code, however the design is how the app would ideally look under fewer time and skill level constraints. The link to the design has an available prototype. 
