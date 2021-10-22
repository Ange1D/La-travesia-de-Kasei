extends Area2D

func _ready():
	$AnimatedSprite.frame=Global.level

func _on_Objects_body_entered(body):
		if body.is_in_group("Player"):
			Global.object=true
			$AudioStreamPlayer.play()
			queue_free()
		
