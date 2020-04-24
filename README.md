# Make Your Choices
An horror interactive story.

# Status
Master :  
[![Build Status](https://travis-ci.com/miong/MakeYourChoices.svg?branch=master)](https://travis-ci.com/miong/MakeYourChoices)  
[![DeepScan grade](https://deepscan.io/api/teams/8790/projects/11002/branches/159303/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=8790&pid=11002&bid=159303)  
Release :  
[![Build Status](https://travis-ci.com/miong/MakeYourChoices.svg?branch=release)](https://travis-ci.com/miong/MakeYourChoices)  
Tools :  
[![Mergify Status][mergify-status]][mergify]  

[mergify]: https://mergify.io
[mergify-status]: https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/miong/MakeYourChoices&style=flat

## Compile
Use the scripts for you operating system.  
Clean : clean build environement  
Compile : build the game  
Release : create a release package  

## Play
The last release is playable there : https://gmion.itch.io/make-your-choices  
To play on local build version use your browser to open build/index.html  

## Contribute

### Issues rules
Anyone can create an issiue.  
Labels and projects must be used.  
Milestone are decided the devs.  
Reviews from another dev are mandatory even if not formal.  

### Commit rules
Test & Clean before any comit.  
Do no override a released zip once milestone is over.  
Push on a dev branche (never to master).  
Merge commits on master when reviews are OK.  

Commint message should be in the form  
\[ACTIVITY] my message.  
where ACTIVITY could be :  
DEV : any new engine feature  
DOC : any documentation updates  
QA  : any quality fix that is not also a bug  
FIX : the commit fix a bug from issues  
STR : the commit concern only the story.  
REL : the commit is a release (Preview or Release) (on release branch)
