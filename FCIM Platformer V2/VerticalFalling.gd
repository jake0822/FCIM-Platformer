extends  Node2D
var sinking = false
var playerSink = false
var player
var x = 0

var pickNode
# Called when the node enters the scene tree for the first time.
func _ready():
	playerSink = true
	sinking = true
	var mT = get_meta("MetaTest")
	pickNode = get_meta("PlatSet")
	var rng = RandomNumberGenerator.new()
	var indexPick = rng.randi_range(0,pickNode.size()-1)
	var n = get_meta("PlatSet" )[indexPick]
	#i dunno how godot does active and inactive states, Jake, lol
	#i tried, but i need to look at the godot manual more
	#n.set_visible(true)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sinking:
		_sinks()
	


func _on_body_entered(body):
	if body.is_in_group("players"):
		player = body
		playerSink = true
		sinking = true
		

func _on_body_exited(body):
	playerSink= false
func _sinks():
	position.y+=1
	if playerSink:
		player.position.y += 1
	
