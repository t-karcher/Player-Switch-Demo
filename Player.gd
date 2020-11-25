extends Sprite
class_name Player

onready var camera : Camera2D = $PlayerCam
const MOVE_SPEED = 200

func _ready():
	$Label.text = "(" + self.name + ")"

func move(dir:Vector2):
	position += dir * MOVE_SPEED
