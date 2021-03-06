extends Area

var target = null
var speed = 200.0
var original_target_location

func _process(delta):
	if target:
		self.translate(Vector3.FORWARD * (speed * delta))

func setTarget(t):
	target = t
	self.look_at(target.global_transform.origin, Vector3.UP)
	original_target_location = target.global_transform.origin

func getTargetLocation():
	return original_target_location


func _on_VisibilityNotifier_screen_exited():
	print("Bullet exited the screen")
	queue_free()
