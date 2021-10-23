extends Node2D

func stopMusic():
	$BgMusic.stop()


func _on_Timer_timeout():
	$AudioStreamPlayer.play()
	$Timer.stop()
