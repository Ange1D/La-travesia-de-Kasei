extends Area2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") && Global.object==true:
		match(Global.level):
			1:
				Global.level=2
				Global.object=false
				get_tree().change_scene("res://Assets/Levels/Two/Level2.tscn")
			2:
				Global.level=1
				Global.object=false
				get_tree().call_deferred("change_scene", "res://Assets/Menu/Menu.tscn")
	elif body.is_in_group("Player") && Global.object==false:
		$Label.visible=true

