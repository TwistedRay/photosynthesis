import bpy
x_offset = 0.866025
y_offset = 1.5
gap = 0.01

path = [
    (2, 0, 3),
    (1, 1, 1), (-2, 0, 4),
    (-1, 1, 1), (2, 0, 5),
    (1, 1, 1), (-2, 0, 6),
    (1, 1, 1), (2, 0, 5),
    (-1, 1, 1), (-2, 0, 4),
    (1, 1, 1), (2, 0, 3),
]


def get_gap(direction: int):
    return gap if direction > 0 else -gap


def duplicate_block(x_direction: int, y_direction: int, count: int):
    for i in range(count):
        bpy.ops.object.duplicate_move(
            TRANSFORM_OT_translate={
                "value": (
                    x_direction * x_offset + get_gap(x_direction),
                    y_direction * y_offset + get_gap(y_direction),
                    0
                )
            }
        )


def create_board():
    for x, y, count in path:
        duplicate_block(x, y, count)
