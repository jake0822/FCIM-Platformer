extends Node2D

@export var cameraFollow = false
@onready var label = $Camera2D/Node2D/Label
var Level2Unlocked = false
var availableFruit = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.fruitCollected = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#sets fruit label
	$Content/EndLv1.text = "Need " + str(availableFruit - Globals.fruitCollected) + " More \nFruit to Continue"
	label.text = str(Globals.fruitCollected) + "/" + str(availableFruit) 
	if Globals.fruitCollected == availableFruit:
		Globals.fruitCollected = 0
		$Content/CollisionShapes/TutColl.collision_layer = 6
		$Content/CollisionShapes/TutColl.collision_mask = 6
		if availableFruit == 32:
			availableFruit = 0
			label.hide()
			$Camera2D/Node2D/Scoreboard.hide()
			$Content/EndLv1.hide()
			Level2Unlocked = true
			
		availableFruit = 32
		
		cameraFollow= true
		
	#loops music
	if not $AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play()
	#makes camera follow players x axis when needed
	if cameraFollow:
		#if not $Camera2D.position.x == $Player.position.x:
		$Camera2D.position.x = $Camera2D.position.move_toward($Player.position, 20).x
		#else:
		#$Camera2D.position.x = $Player.position.x
	if Level2Unlocked == false and $Camera2D.position.x > -1697:
		$Camera2D.position.x = -1697
	#bring Pillars back
	if Globals.unsink == true:
		set_group_positions("Sinkers", 380)
		Globals.unsink = false
		
func set_group_positions(group_name: String, yposition: int):
	var group_members = get_tree().get_nodes_in_group(group_name)
	for member in group_members:
		if member is Node2D:
			member.position.y = yposition
			member.sinking = false
