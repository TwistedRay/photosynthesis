extends Spatial

var x_offset = 1.742
var z_offset = 0.01
var gap = 0.01
onready var Item = preload("res://Cylinder.tscn")
onready var test_material = preload("res://materials/SelectedCylinder.tres")
var path = [
	{
		"x":0,
		"z":0,
		"count":4
	},
	{
		"x":-0.866,
		"z":-1.44,
		"count":5
	},
	{
		"x":-1.742,
		"z":-2.95,
		"count":6
	},
	{
		"x":-2.608,
		"z":-4.35,
		"count":7
	},
	{
		"x":-1.732,
		"z":-5.86,
		"count":6
	},
	{
		"x":-0.866,
		"z":-7.28,
		"count":5
	},
	{
		"x":0.01,
		"z":-8.79,
		"count":4
	}
]

#var path = [
#	{
#		"x": 2,
#		"y": 0,
#		"count": 3
#	},
#	{
#		"x": 1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": -2,
#		"y": 0,
#		"count": 4
#	},
#	{
#		"x": -1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": 2,
#		"y": 0,
#		"count": 5
#	},
#	{
#		"x": 1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": -2,
#		"y": 0,
#		"count": 6
#	},
#	{
#		"x": 1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": 2,
#		"y": 0,
#		"count": 5
#	},
#	{
#		"x": -1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": -2,
#		"y": 0,
#		"count": 4
#	},
#	{
#		"x": 1,
#		"y": 1,
#		"count": 1
#	},
#	{
#		"x": 2,
#		"y": 0,
#		"count": 3
#	}
##    (2, 0, 3),
##    (1, 1, 1), (-2, 0, 4),
##    (-1, 1, 1), (2, 0, 5),
##    (1, 1, 1), (-2, 0, 6),
##    (1, 1, 1), (2, 0, 5),
##    (-1, 1, 1), (-2, 0, 4),
##    (1, 1, 1), (2, 0, 3),
#]

func _ready():
#	pass
	create_board()



func get_gap(direction: int):
	return gap if direction > 0 else -gap


func duplicate_block(x_position: float, z_position: float, count: int):
	print(range(count))
	for i in range(count):
#		var x = x_direction * x_offset + get_gap(x_direction)
#		var z = z_direction * z_offset + get_gap(z_direction)
		var x = x_position + i * x_offset
		var z = z_position + i * z_offset
		var Vect3 = Vector3(x,0,z)
		print("x : " + str(x) + " " + "z: " + str(z))
		var newElement = Item.instance()
		newElement.translate(Vect3)
#		newElement.set_surface_material(0,test_material)
		self.add_child(newElement)
#        bpy.ops.object.duplicate_move(
#            TRANSFORM_OT_translate={
#                "value": (
#                    x_direction * x_offset + get_gap(x_direction),
#                    y_direction * y_offset + get_gap(y_direction),
#                    0
#                )
#            }
#        )


func create_board():
	for item in path:
		duplicate_block(item["x"], item["z"], item["count"])
