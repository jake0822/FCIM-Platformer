extends CharacterBody2D
func _ready():
	velocity.x = -290
	
	pass
func _process(delta):
	
	move_and_slide()


func _on_timer_timeout():
	$Timer.start()
	$Sprite2D.scale.x = $Sprite2D.scale.x * -1
	velocity.x = velocity.x * -1


func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		$DeathSFX.play()
		body.velocity = Vector2.ZERO
		body.rotation = -90
		body.MovementLock = true
		Globals.waterJumpAvailable = false
		Globals.unsink = true
		
		
