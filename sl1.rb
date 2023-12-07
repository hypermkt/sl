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
  # カーソルを非表示
  Curses.curs_set(0)

  # ユーザーの入力内容を画面に表示しない
  Curses.noecho

  while true
    Curses.clear
    Curses.timeout = 50 # タイムアウトをミリ秒単位で設定（500ミリ秒＝0.5秒）

    message = '🚃'
    puts count

    y =  Curses.lines / 2
    x =  Curses.cols - message.length + count
    Curses.setpos(y, x)
    Curses.addstr(message.to_s)

    # 画面を更新して変更を反映
    Curses.refresh

    count -= 1

    count = 0 if x <= 1

    # ユーザーがなにかキーを押すまでプログラムを待機。
    Curses.getch
  end
ensure
  Curses.close_screen
end
