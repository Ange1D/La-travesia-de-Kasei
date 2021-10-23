extends Control

func _on_Button2_pressed():
	$AudioStreamPlayer.stop()
	get_tree().call_deferred("change_scene", "res://Assets/Menu/Menu.tscn")
