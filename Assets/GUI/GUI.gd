extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	if $TextureProgress.value<= 0:
		$HBoxContainer/Label.text = "time out"


func _on_Timer_timeout():
	get_node("TextureProgress").value-=1
	$AnimatedSprite.frame+=1
