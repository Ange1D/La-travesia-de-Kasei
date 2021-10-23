extends Node2D

func _ready():
	$Position2D/AnimationPlayer.play("Running")

func stopMusic():
	$BgMusic.stop()


func _on_Timer_timeout():
	$AudioStreamPlayer.play()
	$Timer.stop()
