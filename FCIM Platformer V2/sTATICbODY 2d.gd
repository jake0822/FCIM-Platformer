extends StaticBody2D

var dir = 1
var playerOnPlat = false
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 2*dir
	#if playerOnPlat:
		#player.position.y += 2*dir


func _on_timer_timeout():
	dir = dir *-1


func _on_area_2d_body_exited(body):
	
	playerOnPlat = false


func _on_area_2d_body_entered(body):
	player = body
	playerOnPlat = true
