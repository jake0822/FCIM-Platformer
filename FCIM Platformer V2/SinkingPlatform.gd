extends Area2D
var sinking = false
var playerSink = false
var player
var x = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sinking:
		_sinks()
	else:
		position.y += sin(x) /2
		x=x+0.05
	


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
	
