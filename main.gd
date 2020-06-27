extends Spatial

var x_offset = 1.742
var z_offset = 0.01
onready var Item = preload("res://Cylinder.tscn")
signal got_seeded
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


func _ready():
	create_board()

func duplicate_block(x_position: float, z_position: float, count: int):
	for i in range(count):
		var x = x_position + i * x_offset
		var z = z_position + i * z_offset
		var Vect3 = Vector3(x,0,z)
		var newElement = Item.instance()
		newElement.translate(Vect3)
		newElement.connect("seeded", self, "_on_Seeded")
		self.add_child(newElement)

func _on_Seeded():
	emit_signal("got_seeded")

func create_board():
	for item in path:
		duplicate_block(item["x"], item["z"], item["count"])
