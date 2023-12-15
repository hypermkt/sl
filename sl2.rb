# ========================================
#     sl.c: SL version 5.03
#         Copyright 1993,1998,2014-2015
#                   Toyoda Masashi
#                   (mtoyoda@acm.org)
#         Last Modified: 2014/06/03
# ========================================
require "curses"
Curses.init_screen # Cursesの初期化
begin
  Curses.curs_set(0) # カーソルを非表示
  Curses.noecho # ユーザーの入力内容を画面に表示しない

  0.upto(Curses.cols - 1) do |i|
    Curses.clear

    train = [
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

    train.each_with_index do |line, index|
      y = Curses.lines / 2 + index
      x = Curses.cols - train[0].size - i
      Curses.setpos(y, x)
      Curses.addstr(line)
    end

    Curses.refresh # 画面を更新して変更を反映
    sleep(0.1)
    break if i >= Curses.cols - lines[0].size # 画面左まで到達したら終了
  end
ensure
  Curses.close_screen
end
