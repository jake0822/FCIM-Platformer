extends Area2D


var x = 0
@onready var bounceRange = randf_range(0.01, 0.04)
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0, 3)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += sin(x) /12
	x=x+ bounceRange
	
	
	
	
func _on_body_entered(body):   #fruit collection
	if body.is_in_group("players"):
		$SFX.play()
		$AnimatedSprite2D.queue_free()
		$CollisionShape2D.queue_free()
		Globals.fruitCollected += 1
		
