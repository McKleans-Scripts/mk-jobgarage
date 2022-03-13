# garage.lua
This is a simple business job locked garage script, This scripts spawns 1 vehicle in a set location for the specified job.

## Instructions
 - Place file inside the client file of the script you want a garage for
 - replace `ScriptNameHere` with the script your placing this file into
 - Create and place in the Boxzone details (I used an item to interact with)
 - Change the Vehicle Hash to the type of Vehicle you want
 - Set the Vecotor4 of where the Vehicle will spawn

And of you go!

## Warning!!
This Vehicle will spawn with a random number plate everytime, so any items left inside will be lost. However, if you uncomment line 18 this will set a specific number plate, meaning if more then 1 of this vehicle is pulled out they will share there storage space.

If anyone knows a fix please make a pull request.

## Dependencies
 - [QBCore Framework](https://github.com/qbcore-framework)

## Credit
 - Adapted by [McKlean](https://github.com/lilphantom25)
 - Oringinal Source [Zach488](https://github.com/Zach488/qb-burgershot) 