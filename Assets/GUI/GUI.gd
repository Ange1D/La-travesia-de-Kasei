extends CanvasLayer

onready var player = get_tree().get_nodes_in_group("Player")[0] 
onready var dog = get_tree().get_nodes_in_group("Dog")[0] 
onready var level = get_tree().get_nodes_in_group("Nivel")[0] 
var obj = false

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	$HBoxContainer/AnimatedSprite.frame=Global.level
	match(Global.level):
		1:
			if Global.object==true:
				$VBoxContainer2/Sprite.visible=true
			else:
				$VBoxContainer2/Sprite.visible=false
		2:
			$VBoxContainer2/Sprite.visible=true
			if Global.object==true:
				$VBoxContainer2/Sprite2.visible=true
			else:
				$VBoxContainer2/Sprite2.visible=false

	if $TextureProgress.value<= 0:
		level.stopMusic()
		$VBoxContainer.visible=true
		if is_instance_valid(player):
			player.queue_free()
			if(not $AudioStreamPlayer.playing):
				$AudioStreamPlayer.play()
		if is_instance_valid(dog):
			dog.queue_free()
			
	if  obj == false && Global.object==true && not $AudioObj.playing:
		$AudioObj.play()
		obj = true


func _on_Timer_timeout():
	get_node("TextureProgress").value-=1


func _on_Button_pressed():
	Global.object=false
	$AudioStreamPlayer.stop()
	get_tree().call_deferred("reload_current_scene")


func _on_Button2_pressed():
	$AudioStreamPlayer.stop()
	get_tree().call_deferred("change_scene", "res://Assets/Menu/Menu.tscn")
	
