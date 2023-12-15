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
    train = '🚃🚃🚃🚃🚃🚃🚃🚃🚃🚃🚃'
    y =  Curses.lines / 2 # 縦軸 中央表示
    x =  Curses.cols - train.length * 2 - i # 横軸 右端から表示
    Curses.setpos(y, x)
    Curses.addstr(train)
    Curses.refresh # 画面を更新して変更を反映
    sleep(0.1)
    break if x <= 0 # 画面左まで到達したら終了
  end
ensure
  Curses.close_screen
end
