# ========================================
#     sl.c: SL version 5.03
#         Copyright 1993,1998,2014-2015
#                   Toyoda Masashi
#                   (mtoyoda@acm.org)
#         Last Modified: 2014/06/03
# ========================================
require "curses"

# Cursesの初期化
Curses.init_screen
begin
  count = 0
  while true
    # カーソルを非表示
    Curses.curs_set(0)

    # ユーザーの入力内容を画面に表示しない
    Curses.noecho

    lines = [
      "      ====        ________                ___________ ",
      "  _D _|  |_______/        \\__I_I_____===__|_________| ",
      "   |(_)---  |   H\\________/ |   |        =|___ ___|   ",
      "   /     |  |   H  |  |     |   |         ||_| |_||   ",
      "  |      |  |   H  |__--------------------| [___] |   ",
      "  | ________|___H__/__|_____/[][]~\\_______|       |   ",
      "  |/ |   |-----------I_____I [][] []  D   |=======|__ ",
    "__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__ ",
    " |/-=|___|=    ||    ||    ||    |_____/~\\___/        ",
    "  \\_/      \\O=====O=====O=====O_/      \\_/            "
    ]

    Curses.clear
    Curses.timeout = 50 # タイムアウトをミリ秒単位で設定（500ミリ秒＝0.5秒）

    lines.each_with_index do |line, index|
      y = Curses.lines / 2 + index
      x = Curses.cols - lines[0].size + count
      Curses.setpos(y, x)
      Curses.addstr(line)
      count = 0 if x <= 0
    end

    # 画面を更新して変更を反映
    Curses.refresh

    # sleep(0.0001)
    count -= 1

    # ユーザーがなにかキーを押すまでプログラムを待機。
    Curses.getch
  end
ensure
  Curses.close_screen
end
