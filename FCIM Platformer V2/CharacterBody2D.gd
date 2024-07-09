extends CharacterBody2D


var SPEED = 16000.0
const DASHSPEED = 1000
@export var JUMP_VELOCITY = -400.0
@export var WATER_JUMP_VELOCITY = -800

var cheats = false
var MovementLock = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction
var yDirection

func _physics_process(delta):
	if not MovementLock:
		
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		# Handle jump.
		if Input.is_action_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$JumpSFX.play()
		#Handle Water Jump d
		if Input.is_action_pressed("jump") and Globals.waterJumpAvailable == true:
			Globals.waterJumpAvailable = false
			velocity.y = WATER_JUMP_VELOCITY

		# Get the input direction and handle the movement
		if Input.is_action_pressed("Left"):
			direction = -1
			$Sprite2D.scale.x = -0.162
		elif Input.is_action_pressed("right"):
			direction = 1
			$Sprite2D.scale.x = 0.162
		else: 
			direction = 0
		velocity.x = direction * SPEED * delta
		
		#develop Cheats
		if Input.is_action_just_pressed("Cheats"):
			cheats = not cheats
		if cheats:
			SPEED = 64000
			if Input.is_action_pressed("down"):
				yDirection = 1
			elif Input.is_action_pressed("up"):
				yDirection = -1
			else:
				yDirection = 0
			velocity.y = yDirection *SPEED* delta
		else:
			SPEED = 16000
	elif MovementLock == true:
		collision_mask = 2
		collision_layer = 2
		Globals.ResetLevel = true
		
		velocity.y = -300
		position = position.move_toward(Vector2(759, 450), 20)
		if position == Vector2(759,450):
			MovementLock = false
			rotation = 0
			collision_mask = 1
			collision_layer = 1
			
		#handles dash
		#if Input.is_action_pressed("dash") and DashLock == false:
			#position.x += direction * DASHSPEED * delta
			#DashLock = true
		#if is_on_floor():
			#DashLock = false
		
		
	move_and_slide()
