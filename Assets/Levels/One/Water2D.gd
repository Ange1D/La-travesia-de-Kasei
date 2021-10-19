extends Area2D

onready var player = get_tree().get_nodes_in_group("Player")[0] 

var agua=false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if(agua==true):
		player.motion.x = - 500

func _on_Water2D_body_entered(body):
	if body.is_in_group("Player"):
		agua=true
		
		#$AnimatedSprite.play("default")


func _on_Water2D_body_exited(body):
	if body.is_in_group("Player"):
		agua=false
		#$AnimatedSprite.stop()
