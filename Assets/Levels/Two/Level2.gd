extends Node2D



func _ready():
	$Position2D/AnimationPlayer.play("move")
	$Position2D2/AnimationPlayer.play("move")
	$Position2D3/AnimationPlayer.play("move")
	$Position2D4/AnimationPlayer.play("move")


func stopMusic():
	$BgMusic.stop()


func _on_Timer_timeout():
	$AudioStreamPlayer.play()
	$Timer.stop()
