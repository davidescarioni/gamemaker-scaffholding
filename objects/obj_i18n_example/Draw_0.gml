var _text = get_dictionary_value("startMenu.start")
var _text_coins = get_dictionary_value("HUD.coins")

draw_text(10, 10, _text)
draw_text(10, 40, string(_text_coins, "15"))