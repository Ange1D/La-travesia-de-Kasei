extends CanvasLayer

onready var player = get_tree().get_nodes_in_group("Player")[0] 
onready var dog = get_tree().get_nodes_in_group("Dog")[0] 

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	if Global.object==true:
		$VBoxContainer2.visible=true
	if $TextureProgress.value<= 0:
		$VBoxContainer.visible=true
		if is_instance_valid(player):
			player.queue_free()
		if is_instance_valid(dog):
			dog.queue_free()


func _on_Timer_timeout():
	get_node("TextureProgress").value-=1
	$HBoxContainer/AnimatedSprite.frame=Global.level


func _on_Button_pressed():
	get_tree().call_deferred("reload_current_scene")


func _on_Button2_pressed():
	get_tree().call_deferred("change_scene", "res://Assets/Menu/Menu.tscn")
