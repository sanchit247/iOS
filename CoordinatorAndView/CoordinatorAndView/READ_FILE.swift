/*
    Coordinators are mostly used in viper design pattern
 
   In this project coordinates are used for which
   1.) remove root view controller if any from main.story board
   2.) set project Setting -> General -> main interface to nothing
   3.) some updates in  AppDelegate file

   after that add files
   1.) coordinator.swift
   2.) MainCoordinator.swift
   3.) StoryBoard.swift


   * for useing it VC class has to confirm storyBoard protocol
   * for every vc that can redirect to some other vc has to make a var of coodinator
   * if used button in any view then make its action in its vc's view file
   * No segues are used

*/
