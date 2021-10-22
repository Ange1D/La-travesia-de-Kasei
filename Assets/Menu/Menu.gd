extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Assets/Levels/One/Level1.tscn")


func _on_TextureButton_pressed():
	if(not $AudioBtn.is_playing()):
		$AudioBtn.play()
	$Timer.start()


func _on_Timer_timeout():
	Global.level=1
	Global.object=false
	get_tree().change_scene("res://Assets/Levels/One/Level1.tscn")
