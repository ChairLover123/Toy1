extends CharacterBody2D
const GRAVITY = 10
const JUMP_POWER = -300
var db = false
var was_on_floor = false
func _process(delta):
	if Input.is_action_pressed("mr"):
		velocity.x += 1
	if Input.is_action_pressed("ml"):
		velocity.x -= 1
	position += velocity * delta
func _physics_process(delta):
	velocity.y += GRAVITY
	if not was_on_floor && is_on_floor():
		$sfx2.play()
	was_on_floor = is_on_floor()
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		velocity.y = JUMP_POWER
		$sfx.play()
		db = true
	if Input.is_action_just_pressed("ui_accept") && not is_on_floor() && db == true:
		velocity.y = JUMP_POWER
		db=false
	#if not Input.is_action_just_pressed("ui_accept") && is_on_floor():
		#$sfx2.play()
	move_and_slide()
		
