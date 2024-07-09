extends Area2D

var startGame = false
var LR = -3
var HR = 2

var x=0
var x1 = 0
var x2 = 0
var x3 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$WaterLayer1.position.y = sin(x) * 20
	x = x+ 0.05
	$WaterLayer2.position.y = sin(x1) * 20
	x1 = x1+ 0.06
	$WaterLayer3.position.y = sin(x2) * 20
	x2 = x2+ 0.055
	$WaterLayer4.position.y = sin(x3) * 20
	x3 = x3+ 0.065

func _on_body_entered(body):
	if body.is_in_group("players"):
		body.velocity.y = -250
		Globals.waterJumpAvailable = true
		


func _on_timer_timeout():
	pass
	#startGame = true
