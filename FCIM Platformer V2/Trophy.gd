extends Area2D

@onready var interaction_area = $InteractionArea
@onready var trophy 

func _ready():
	interaction_area.interact = Callable(self, "_pick_up_trophy")

func _pick_up_trophy():
	
	$Sprite2D.hide()
	$Win.show()
