extends Node2D

var PlatformResource
var PlatformInstance
var Platform_Path = "res://sinking_platform.tscn"
var LastPlatorm: Vector2 = Vector2(900, 305)
var Generating = true
var Platforms = []
# Called when the node enters the scene tree for the first time.
func _ready():
	PlatformResource = load(Platform_Path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.ResetLevel == true:
		for plat in Platforms:
			plat.queue_free()
		Platforms.clear()
		$Timer.start()
		LastPlatorm = Vector2(900, 305)
		Globals.ResetLevel = false
		Generating = true
	if Generating == true:
		_generate_platform(LastPlatorm)
func _generate_platform(LastPlatLocation: Vector2):
	PlatformInstance = PlatformResource.instantiate()
	if PlatformInstance:
		add_child(PlatformInstance)
		Platforms.push_back(PlatformInstance)
		PlatformInstance.position = LastPlatLocation + Vector2(200, 100)
		#ecc
		if PlatformInstance.position.y > 500:
			PlatformInstance.position.y -= 50
		LastPlatorm = LastPlatLocation + Vector2(randf_range(150, 200), randf_range(-50, 50))


func _on_timer_timeout():
	Generating = false
	
