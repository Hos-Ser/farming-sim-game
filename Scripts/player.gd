extends CharacterBody2D

var speed := 100  

func _physics_process(_delta):
	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	if direction.length() > 0:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method(""):
		pass

func _on_player_hitbox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
