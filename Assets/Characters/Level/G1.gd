extends Area2D

onready var dog = get_tree().get_nodes_in_group("Dog")[0] 

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") && Global.object==true:
		match(Global.level):
			1:
				Global.level=2
				Global.object=false
				get_tree().change_scene("res://Assets/Levels/Two/Level2.tscn")
			2:
				Global.level=3
				Global.object=false
				get_tree().change_scene("res://Assets/Levels/Three/Level3.tscn")
			3:
				Global.level=1
				Global.object=false
				get_tree().call_deferred("change_scene", "res://Assets/Menu/Creditos.tscn")
	elif body.is_in_group("Player") && Global.object==false:
		$Sprite.visible=true
		if(not $AudioStreamPlayer.playing):
			$AudioStreamPlayer.play()
			
	if body.is_in_group("Dog"):
		if is_instance_valid(dog):
			dog.queue_free()



func _on_Area2D_body_exited(body):
	if body.is_in_group("Player") && Global.object==false:
		$Sprite.visible=false
		
