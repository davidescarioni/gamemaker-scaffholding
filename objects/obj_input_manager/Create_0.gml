//CREATE EVENT obj_controller
enum ACTION {
    JUMP,
    SHOOT,
    MOVE
}

bindings = [
    {
        "id": ACTION.JUMP,
        "keyboard": [
            vk_space,
            vk_up,
        ],
        "gamepad": [
            gp_face1
        ],
        "gamepad_id": 0,
    },
    {
        "id": ACTION.SHOOT,
        "mouse": [
            mb_left
        ],
        "gamepad": [
            gp_shoulderr,
            gp_shoulderrb,
        ],
        "gamepad_id": 0,
    },
];

axes = [
    {
        "id": ACTION.MOVE,
        "keyboard": {
            "negative": [
                vk_left, 
                ord("A")
            ],
            "positive": [
                vk_right, 
                ord("D")
            ],
        },
        "gamepad": {
            "negative": [gp_padl],
            "positive": [gp_padr],
        },
        "gamepad_axis": gp_axislh,
    }
]

input_setup(bindings, axes);