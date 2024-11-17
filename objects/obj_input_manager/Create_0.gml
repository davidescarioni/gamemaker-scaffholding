//CREATE EVENT obj_controller
enum ACTION {
	UP,
	DOWN,
    JUMP,
    SHOOT,
    MOVE_HORIZONTAL,
	MOVE_VERTICAL,
	CONFIRM,
	QUIT,
}

bindings = [
	{
        "id": ACTION.UP,
        "keyboard": [
			vk_up, 
             ord("W")
        ],
		"gamepad": [
            gp_padu
        ],
		"gamepad_id": 0,
    },
	{
        "id": ACTION.DOWN,
        "keyboard": [
			vk_down, 
             ord("S")
        ],
		"gamepad": [
            gp_padd
        ],
	    "gamepad_id": 0,
    },
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
        "id": ACTION.CONFIRM,
		"keyboard": [
            ord("Z"),
			vk_enter
        ],
		"gamepad": [
            gp_face1,
        ],
		"gamepad_id": 0,
    },
	{
        "id": ACTION.QUIT,
		"keyboard": [
			vk_escape
        ]
    },
];

axes = [
    {
        "id": ACTION.MOVE_HORIZONTAL,
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