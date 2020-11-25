extends Node2D

onready var transition_cam : Camera2D = $TransitionCamera
onready var cam_tween : Tween = $CameraTween

onready var p1 : Player = $Player1
onready var p2 : Player = $Player2
onready var p3 : Player = $Player3

onready var active_player : Player = p1

func _ready():
	switch_player(p1)

func _input(event):
	if event.is_action_pressed("ui_switch_player"):
		match event.scancode:
			KEY_1: switch_player(p1)
			KEY_2: switch_player(p2)
			KEY_3: switch_player(p3)

func _process(delta):
	if Input.is_action_pressed("ui_left"): active_player.move(Vector2.LEFT * delta)
	if Input.is_action_pressed("ui_right"): active_player.move(Vector2.RIGHT * delta)
	if Input.is_action_pressed("ui_up"): active_player.move(Vector2.UP * delta)
	if Input.is_action_pressed("ui_down"): active_player.move(Vector2.DOWN * delta)

func switch_player (new_player : Player):
	transition_cam.global_position = active_player.global_position
	transition_cam.current = true
	cam_tween.interpolate_property(transition_cam, "global_position", null, new_player.global_position, 0.2)
	cam_tween.start()
	yield(cam_tween,"tween_completed")
	active_player = new_player
	active_player.camera.current = true
