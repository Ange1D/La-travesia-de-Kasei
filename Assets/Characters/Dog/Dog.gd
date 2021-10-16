extends KinematicBody2D

const SPEED = 256
const FLOOR = Vector2(0, -1)
const GRAVITY = 16
const JUMP_HEIGHT = 450
onready var motion = Vector2.ZERO


func _process(_delta):
	motion_ctrl()


func get_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	return axis


func motion_ctrl():
	motion.y += GRAVITY
	
	if get_axis().x == 1:
		$AnimatedSprite.flip_h = true
	elif get_axis().x == -1:
		$AnimatedSprite.flip_h = false
	
	if get_axis().x != 0:
		motion.x =  get_axis().x * SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if get_axis().x != 0:
			$AnimatedSprite.play("Run")
			if (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right") ):
				if(not $Run.is_playing()):
					$Sit.stop()
					$Run.play()
		else:
			$AnimatedSprite.play("Sit")
			$Run.stop()
			
		
		if Input.is_action_just_pressed("ui_accept"):
			$Sit.play()
			motion.y -= JUMP_HEIGHT
	else:
		if motion.y < 0:
			$AnimatedSprite.play("Run")#JUMP
		else:
			$AnimatedSprite.play("Run")#FALL
	
	motion = move_and_slide(motion, FLOOR)
